# FDE Growth：SEO / GEO / UGC 企业增长

把企业的真实能力转成可被找到、可被理解、能带来有效咨询的资料，并连接到预约、报价和成交流程。

本仓库包含 2026-11-17 调研、戴维 20 条 GEO 视频的方法蒸馏，以及可安装的 Codex skill。研究建议尚未经过客户增长实验验证。

## 阅读入口

- [完整调研报告](调研报告.md)：主流打法、代表工具、客户适配及 30 天试点。
- [Skill 入口](skills/fde-growth/SKILL.md)：诊断、实验、内容和交付流程。
- [12 个 GEO 实施配方](skills/fde-growth/references/geo-recipes.md)：技术底座、问题库、证据内容、分发与测量。
- [20 条视频证据台账](skills/fde-growth/references/creator-distillation.md)：原链接、时间定位、采用判断和证据边界。
- [测量约定](skills/fde-growth/references/measurement.md)、[26 项来源](skills/fde-growth/references/sources.md)、[交付与验证](交付与验证.md)。

## 安装与调用

将 `skills/fde-growth` 文件夹复制到 Codex 的 `~/.codex/skills/`，或项目的 `.agents/skills/`。保留文件夹名称和内部结构；必要时开启新会话刷新发现。

> 用 $fde-growth 为这家企业做增长诊断。市场、产品、官网如下……请识别影响有效询盘的瓶颈，给出 30 天试点、内容 brief、技术检查和验收口径。缺少证据的地方标为假设。

## 字幕取样方法

20 条参考视频总长约 10 分 54 秒，按约 0.25 秒间隔识别画面字幕，形成 2,623 帧时间序列，并对关键数字和限定条件做画面抽检。该方法可能遗漏无字幕语音或短暂画面，不等于完整音频听写。

`scripts/read_subtitles.swift` 使用 macOS 自带 AVFoundation / Vision / AppKit，可对自行提供且可使用的视频复现字幕取样，不依赖下载 ASR 模型：

```sh
swiftc scripts/read_subtitles.swift -o /tmp/fde-read-subtitles
/tmp/fde-read-subtitles /absolute/path/to/video.mp4
```

结果写在视频旁同名目录。`--probe` 输出单帧与 OCR；`--check` 按同名目录中的 `full_frame_times.json` 时间数组输出指定抽检帧。原视频、OCR 全文、抽检截图和临时下载链接保留在本地，不在仓库中。

## 证据使用

创作者观点、平台文档、供应商研究和我们的实施建议分别归因。个案询盘增幅不构成客户承诺；引用、点击与成交分别验证。报告没有在客户账号运行广告或增长实验。
