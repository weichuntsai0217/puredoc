# 文件輸入 `*.md`
* Markdown 為主 (要支援 foot note & extended table)
* Latex 為輔 (因為 Latex 在 打數學式, 編章節號 + 圖表號 + 方程式號, 以及編索引 是最方便的)
  - `\label` & `\ref`
  - `\index`
  - `\begin{equation} ... \end{equation}`
  - `\begin{align} ... \end{align}`
* 如有必要使用 HTML, 必須列出有template支援style的 HTML tag

# 文件轉換
* 在有 HTML template with css 的基礎下, 將 Markdown & Latex (使用 mathjax) 轉成 HTML 並塞入 template
* 要測過過困難的數學式看可不可行

# PDF render engine
必須要可以自動抓系統的預設字體, 也可以自訂字體, 自訂字體若有缺字, 會自動使用系統預設字體補上
* jsPDF
* wkhtmltopdf
* weasyprint
* chromium headless

# 文件輸出
* HTML
* PDF
* EPUB
