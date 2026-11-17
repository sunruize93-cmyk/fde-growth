import Foundation
import AVFoundation
import Vision
import AppKit

let video = URL(fileURLWithPath: CommandLine.arguments[1])
let root = video.deletingLastPathComponent().appendingPathComponent(video.deletingPathExtension().lastPathComponent, isDirectory: true)
try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
let asset = AVURLAsset(url: video)
let tracks = asset.tracks(withMediaType: .video)
guard let track = tracks.first else { fatalError("No video track") }
let duration = CMTimeGetSeconds(asset.duration)
let size = track.naturalSize.applying(track.preferredTransform)
print("duration=\(duration) size=\(size)")
if CommandLine.arguments.contains("--check") {
    let data = try Data(contentsOf: root.appendingPathComponent("full_frame_times.json"))
    let times = try JSONDecoder().decode([Double].self, from: data)
    let gen = AVAssetImageGenerator(asset: asset)
    gen.appliesPreferredTrackTransform = true
    gen.requestedTimeToleranceBefore = CMTime(seconds: 0.08, preferredTimescale: 600)
    gen.requestedTimeToleranceAfter = CMTime(seconds: 0.08, preferredTimescale: 600)
    var rows: [[String:Any]] = []
    for t in times {
        let cg = try gen.copyCGImage(at: CMTime(seconds: t, preferredTimescale: 600), actualTime: nil)
        let req = VNRecognizeTextRequest()
        req.recognitionLevel = .accurate
        req.recognitionLanguages = ["zh-Hans", "en-US"]
        req.usesLanguageCorrection = true
        try VNImageRequestHandler(cgImage: cg, options: [:]).perform([req])
        let lines = (req.results ?? []).compactMap { $0.topCandidates(1).first?.string }
        rows.append(["time":t,"lines":lines])
        print("\(t): \(lines.joined(separator: " | "))")
        let rep = NSBitmapImageRep(cgImage: cg)
        try rep.representation(using: .jpeg, properties: [.compressionFactor: 0.8])!.write(to: root.appendingPathComponent(String(format:"check_%06.2f.jpg",t)))
    }
    try JSONSerialization.data(withJSONObject: rows, options: [.prettyPrinted,.sortedKeys]).write(to: root.appendingPathComponent("full_frame_checks.json"))
    exit(0)
}
if CommandLine.arguments.contains("--probe") {
    let gen = AVAssetImageGenerator(asset: asset)
    gen.appliesPreferredTrackTransform = true
    let cg = try gen.copyCGImage(at: CMTime(seconds: min(5, duration/2), preferredTimescale: 600), actualTime: nil)
    let rep = NSBitmapImageRep(cgImage: cg)
    try rep.representation(using: .jpeg, properties: [.compressionFactor: 0.9])!.write(to: root.appendingPathComponent("frame_probe.jpg"))
    let req = VNRecognizeTextRequest()
    req.recognitionLevel = .accurate
    req.recognitionLanguages = ["zh-Hans", "en-US"]
    req.usesLanguageCorrection = true
    try VNImageRequestHandler(cgImage: cg, options: [:]).perform([req])
    for obs in req.results ?? [] {
        print(obs.boundingBox, obs.topCandidates(1).first?.string ?? "")
    }
    exit(0)
}

let reader = try AVAssetReader(asset: asset)
let output = AVAssetReaderTrackOutput(track: track, outputSettings: [
    kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
])
output.alwaysCopiesSampleData = false
reader.add(output)
guard reader.startReading() else { fatalError("Cannot start reader") }
let dest = root.appendingPathComponent("ocr_frames.jsonl")
FileManager.default.createFile(atPath: dest.path, contents: nil)
let file = try FileHandle(forWritingTo: dest)
var next = 0.0
var processed = 0
let step = 0.25
let request = VNRecognizeTextRequest()
request.recognitionLevel = .accurate
request.recognitionLanguages = ["zh-Hans", "en-US"]
request.usesLanguageCorrection = true
request.minimumTextHeight = 0.012
request.regionOfInterest = CGRect(x: 0, y: 0, width: 1, height: 1)
while let buffer = output.copyNextSampleBuffer() {
    let t = CMTimeGetSeconds(CMSampleBufferGetPresentationTimeStamp(buffer))
    if t + 0.005 < next { continue }
    next += step
    autoreleasepool {
        guard let pixels = CMSampleBufferGetImageBuffer(buffer) else { return }
        do {
            try VNImageRequestHandler(cvPixelBuffer: pixels, options: [:]).perform([request])
            let lines: [[String: Any]] = (request.results ?? []).compactMap { obs in
                guard let s = obs.topCandidates(1).first else { return nil }
                return ["text": s.string, "confidence": s.confidence,
                        "bbox": [obs.boundingBox.minX, obs.boundingBox.minY,
                                 obs.boundingBox.width, obs.boundingBox.height]]
            }
            let row: [String: Any] = ["time": t, "lines": lines]
            let data = try JSONSerialization.data(withJSONObject: row, options: [.sortedKeys])
            file.write(data); file.write(Data([10]))
        } catch {
            print("error_at=\(t): \(error)")
        }
    }
    processed += 1
    if processed % 120 == 0 {
        print("read_seconds=\(String(format: "%.2f", t)) / \(duration); samples=\(processed)")
        fflush(stdout)
    }
}
try file.close()
print("reader_status=\(reader.status.rawValue) samples=\(processed) last_requested=\(next)")
if reader.status != .completed { print("reader_error=\(String(describing: reader.error))"); exit(1) }
