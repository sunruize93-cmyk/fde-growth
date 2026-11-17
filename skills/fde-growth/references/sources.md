# 来源与证据

核对日期：2026-11-17。官方文档证明平台所述机制，供应商文档证明产品功能描述；都不等于本团队已测得增长。以下是简要归纳，具体实施前重新打开相关来源。

| ID | 来源 | 支撑的判断与边界 |
|---|---|---|
| S01 | [Google：AI features and your website](https://developers.google.com/search/docs/appearance/ai-features) | AI 搜索沿用 SEO 基础；没有专用文件或 schema 门槛，出现与收录不保证。仅针对 Google。 |
| S02 | [Google：SEO Starter Guide](https://developers.google.com/search/docs/fundamentals/seo-starter-guide) | 自然组织、独特有用内容、清晰结构等基础；不是固定关键词密度公式。 |
| S03 | [Google：Spam policies](https://developers.google.com/search/docs/essentials/spam-policies) | 规模化低价值内容、隐藏操纵与链接滥用等有风险；AI 辅助不自动等于违规。 |
| S04 | [Google：Local ranking](https://support.google.com/business/answer/7091) | 本地结果涉及相关性、距离、知名度；不能付费购买更好自然排名。 |
| S05 | [Naver：SEO 基础](https://searchadvisor.naver.com/guide/seo-help) | 为韩文网站核对标题、描述、结构和内容可理解性；不代表 Naver 所有内容产品的排名规则。 |
| S06 | [OpenAI：Crawlers](https://developers.openai.com/api/docs/bots) | OAI-SearchBot 与 GPTBot 的搜索/训练用途可独立设置；允许抓取不保证推荐。 |
| S07 | [Bing：AI 可见度新指标](https://blogs.bing.com/search/2026/6/New-AI-Visibility-Insights-in-Bing-Webmaster-Tools-Intents-Topics-Citation-Share-Compare/) | AI Performance 的引用、主题和意图观察；Citation Share 不是流量份额或排名。产品预览能力以账号为准。 |
| S08 | [GEO 论文，KDD 2024](https://arxiv.org/abs/2311.09735) | 有可见度优化研究及领域差异；论文最高提升不等于真实客户的平均效果或营收增幅。 |
| S09 | [Ahrefs：Brand Radar](https://help.ahrefs.com/en/articles/11064852-what-is-brand-radar-and-how-to-use-it) | 提及、引用、竞品与自定义问题追踪能力；平台覆盖和额度随产品变化。 |
| S10 | [Ahrefs：AI Visibility Metrics](https://help.ahrefs.com/en/articles/15501968-ai-visibility-metrics) | 工具自己的指标口径，不能直接当客户访问和成交。 |
| S11 | [Semrush：AI Visibility](https://www.semrush.com/kb/1493-ai-visibility-toolkit) | 提供可见度、问题、竞品和抓取审计功能；市场与套餐不一，本轮未购买或实测账号。 |
| S12 | [Profound：Answer Engine Insights](https://docs.tryprofound.com/answer-engine-insights/about) | 基于采样回答的品牌、引用、情绪、事实分析；与客户业务归因不同。 |
| S13 | [TikTok：Spark Ads](https://ads.tiktok.com/resources/help/article/spark-ads?webview=1) | 可用自身或获授权创作者帖子投广告；这证明复用路径存在，不保证效果。 |
| S14 | [小红书蒲公英](https://pgy.xiaohongshu.com/) / [帮助中心](https://pgy.xiaohongshu.com/faq) | 官方检索摘要介绍创作者合作、众测和内容广告协同；网页正文动态加载，此轮未核验后台细节。 |
| S15 | [Google Maps：内容政策](https://support.google.com/contributionpolicy/answer/7400114) | 禁止激励换评价、指定/筛选好评等；可邀请不受奖励影响的真实反馈。不能把商业内容合作与地图评价混为一谈。 |
| S16 | [FTC：Influencer disclosures](https://www.ftc.gov/business-guidance/resources/disclosures-101-social-media-influencers) | 美国场景下商业关系的披露指导；不能当作中韩全套法律意见。 |

本 skill 的实验顺序、30 天节奏、问题数量、客户适配和服务包装属于我们根据上述依据及 FDE 工作场景提出的方案，未经客户增长实验验证。

工具选择建议：先用客户已有站长工具、统计与 CRM，以及少量人工复测；只有跨客户、语言和引擎的采集工作量成为瓶颈时再比较付费工具。比较可导出的原回答、引用 URL、问题集控制、地区/语言、失败处理和费用，不只看首页总分。

## 视频技术细节与新增平台资料

| ID | 来源 | 用途与边界 |
|---|---|---|
| S17 | [Google：URL 变更迁站](https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes) | URL 映射、永久重定向和持续监测；一般建议重定向保留至少一年。 |
| S18 | [Shopify：structured_data](https://shopify.dev/docs/api/liquid/filters/structured_data) | Liquid 输出 Product / ProductGroup 的能力；不证明所有主题默认调用。 |
| S19 | [Google：产品变体结构化数据](https://developers.google.com/search/docs/appearance/structured-data/product-variants/) | 产品组与变体的支持结构；不保证展示或推荐。 |
| S20 | [Google：可抓取链接](https://developers.google.com/search/docs/crawling-indexing/links-crawlable) | 检查实际 a 元素与 href，不能只靠 JS 点击事件。 |
| S21 | [Google：图片 SEO](https://developers.google.com/search/docs/appearance/google-images/) | 图片与页面上下文、替代文字等；不能推论全部 AI 检索都读或不读图片。 |
| S22 | [Peec：ChatGPT Shopping，美国与欧洲](https://peec.ai/blog/chatgpt-shopping-optimization-in-2026-us-vs.-europe) | 供应商 2026-10-16 观察研究，描述截断现象有地区/场景限制，不是 OpenAI 固定规格。 |
| S23 | [Bing：Topics Portfolio Beta](https://blogs.bing.com/webmaster/2026/10/introducing-topics-portfolio-beta-in-ai-performance/) | 2026-10-13；按站点提供主题与机会问题，分类/数量为方向性，数据不足可能不可见。 |
| S24 | [Google：多模态搜索报告](https://developers.google.com/search/blog/2026/09/web-multimodal-in-sc) | 2026-09-24；新增图片输入等查询的报告视角，站点实际数据仍需后台核实。 |
| S25 | [Peec：Publish stats, get cited](https://peec.ai/blog/publish-stats-get-cited-the-tactic-that-put-my-data-all-over-the-web) | 2026-10-07，含虚构统计实验及另一真实来源统计页。只采用资料可追溯原则，绝不复制假数据做法；供应商自述不是独立因果证据。 |
| S26 | [Google：生成式 AI 表现报告](https://developers.google.com/search/blog/2026/06/gen-ai-performance-reports) | 2026-06-03 公告、08-31 全球上线更新；独立视角仍包含在整体表现中。覆盖 Google 产品，不代表全部 AI 搜索。 |
