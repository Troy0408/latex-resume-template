# 中文技术简历 LaTeX 模板

[![Build Status](https://github.com/Troy0408/latex-resume-template/actions/workflows/example.yml/badge.svg)](https://github.com/Troy0408/latex-resume-template/actions/workflows/example.yml)
[![License: MIT](https://img.shields.io/github/license/Troy0408/latex-resume-template)](LICENSE)
![XeLaTeX](https://img.shields.io/badge/Engine-XeLaTeX-2B579A)

面向中文技术岗位的单页 A4 XeLaTeX 简历模板，支持本地编译与 Overleaf 在线编辑。直接调用 TeX Live 内置开源字体，默认附带一套数字 IC / 硬件应届生虚构示例（[examples/resume.pdf](examples/resume.pdf)），同样适用于软件开发、嵌入式、电子信息等工程方向。

| <a href="examples/resume.pdf"><img src="images/preview.png" alt="单页中文技术简历，个人信息右侧为灰色可选证件照示意图" width="660" /></a> |
| :---: |

[在线查看 / 下载示例 PDF](examples/resume.pdf) · 右上角的灰色「可选证件照」人物框仅用于展示。直接编译主文件时，只有提供个人照片才会显示照片栏。示例中的姓名、院校、实习、项目及奖项均为虚构。

## 模板特点

- **开箱即用，免装商业字体**：直接调用 TeX Live 内置的 Fandol 中文字体、TeX Gyre Termes 西文字体与 Font Awesome 6 图标，Overleaf 与本地环境一致。
- **证件照自适应排版**：放入 `images/photo.jpg` 或 `images/photo.png` 自动切换为带照片页眉，未放照片或关闭开关时自动收起照片栏；`.gitignore` 默认忽略个人照片文件，避免误提交。
- **联系方式灵活增删**：手机号、邮箱、地点、GitHub、个人主页均可单独留空或删去，页眉自动处理间距与整项换行。
- **可检索的 PDF 正文**：姓名、联系方式和各板块保留为文本，CI 使用安装了中文字符映射的 Poppler 检查提取结果。不同 PDF 解析器对中文字体和装饰图标的处理可能不同。
- **样式与正文解耦**：主配置、版式类、页眉、正文与字体分文件维护，并通过 GitHub Actions 持续检查默认样例的编译与中文文本提取。

## 快速开始

### 方式一：Overleaf 在线编辑（推荐，零配置）

1. 点击仓库右上角 **Use this template**（或 **Code → Download ZIP** 下载源码包）。
2. 在 Overleaf 中选择 **New Project → Upload Project** 上传 ZIP（保留目录结构）。
3. 打开左上角 **Menu**，将 **Main document** 设为 `resume-zh_CN.tex`，将 **Compiler** 切换为 **XeLaTeX**，并确认 TeX Live 版本包含 `fontawesome6`（较新版本默认自带；参考 [Overleaf 编译设置文档](https://docs.overleaf.com/getting-started/recompiling-your-project/selecting-a-tex-live-version-and-latex-compiler)）。
4. 编辑 `resume-zh_CN.tex` 与 `texs/sections.tex`，点击 **Recompile** 并下载 PDF。

### 方式二：本地编译（XeLaTeX）

已在 Windows（TeX Live 2026）与 Linux 容器（TeX Live 2025）下验证。完整版 TeX Live 已包含全部依赖；精简安装需具备 `fontspec`、`xeCJK`、`fontawesome6`、`graphicx`、`geometry`、`xcolor`、`titlesec`、`enumitem`、`hyperref`、`bookmark`、`accsupp` 及下方[授权与字体](#授权与字体)所列字体。命令均在项目根目录执行：

- **Linux / macOS**（GNU Make + `latexmk`）：

```sh
make          # 等同于 make zh_CN，输出 build/resume.pdf
make clean    # 清理编译缓存与 build/resume.pdf
```

- **Windows**（PowerShell，使用与 `Makefile` 相同的 `latexmk` 参数）：

```powershell
latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build -jobname=resume resume-zh_CN.tex
```

> 使用 `-g` 参数会强制重新检查可选照片，新增、删除或替换证件照时也会立即刷新输出；编译日志与辅助文件均写入 `build/`。

## 目录结构

```text
latex-resume-template/
├── resume-zh_CN.tex                # 主文件：个人信息、颜色、边距与照片开关
├── resume.cls                      # 版式类：标题层级、列表样式与联系方式命令
├── texs/
│   ├── header_with_photo.tex       # 页眉布局与可选证件照
│   └── sections.tex                # 教育背景、项目经历、技能与可选模块
├── stys/
│   └── fonts.tex                   # 中西文字体与实际文本映射设置
├── examples/
│   ├── preview.tex                 # 带灰色证件照示意图的展示入口
│   └── resume.pdf                  # 展示版 PDF
├── images/
│   ├── preview.png                 # README 展示用的示例预览图
│   ├── photo-placeholder.png       # 灰色人物框，仅展示版使用
│   └── photo.{jpg,png}             # 个人证件照放置位置（已加入 .gitignore）
├── build/                          # 本地编译输出目录（已加入 .gitignore）
├── .github/workflows/example.yml   # GitHub Actions 自动编译与文本检查
├── Makefile                        # 本地编译、更新预览图与清理快捷命令
├── .editorconfig                   # 编辑器编码与缩进规范
├── .gitattributes                  # 跨平台换行符与二进制文件规范
├── .gitignore                      # 忽略编译产物、系统缓存与个人照片
├── README.md
└── LICENSE
```

## 填写与自定义

### 1. 个人信息与证件照（`resume-zh_CN.tex`）

| 参数 / 命令 | 说明 | 默认值 |
| --- | --- | --- |
| `\resumename` | 姓名（同步写入 PDF 作者元数据） | `林知远` |
| `\resumetarget` | 姓名下方的求职意向，可留空或删除 | `数字 IC 设计与验证工程师` |
| `\resumephone` | 手机号，留空或删除则不显示 | `1XX-XXXX-XXXX` |
| `\resumeemail` | 邮箱（自动生成 `mailto:` 链接） | `lin.zhiyuan@example.com` |
| `\resumeaddress` | 所在城市或期望地点 | `上海` |
| `\githubuser` | GitHub 用户名（自动生成 `github.com/用户名`） | 空（不显示） |
| `\resumewebsite` | 个人主页或作品集完整链接 | 空（不显示） |
| `\showphototrue` / `\showphotofalse` | 控制是否启用页眉右侧证件照 | `\showphototrue` |
| `\photopath` | 证件照路径前缀（不含扩展名） | `images/photo` |
| `\photowidth` / `\photoheight` | 照片展示区域宽高 | `2.25cm` × `3cm` |

将证件照保存为 `images/photo.jpg` 或 `images/photo.png` 后重新编译即可；同名时 `.jpg` 优先于 `.png`。照片会在 **22.5 × 30 mm** 区域内居中等比缩放并完整保留原图，横图或窄图余处留白、不裁剪。未放置照片或设为 `\showphotofalse` 时，页眉自动收起照片栏。

### 2. 正文内容与常用命令（`texs/sections.tex`）

| 命令 / 环境 | 作用 | 示例 |
| --- | --- | --- |
| `\sectionTitle{模块名}{图标}` | 带 Font Awesome 图标的模块标题与通栏细线 | `\sectionTitle{项目经历}{\faUsers}` |
| `\datedsubsection{标题}{日期}` | 左侧正文标题 + 右侧灰字日期 | `\datedsubsection{\textbf{项目名}}{2025.09 -- 2025.12}` |
| `\datedline{内容}{日期}` | 单行左右对齐条目，适合荣誉奖项 | `\datedline{奖学金 / 示例大学}{2025.10}` |
| `\role{技术关键词}{分工或角色}` | 标题下方的斜体技术栈与个人分工行 | `\role{Verilog / Verilator}{RTL 与验证}` |
| `\normalline{文字}` | 普通无圆点段落行 | `\normalline{专业方向：数字集成电路设计}` |
| `\texthl{重点词}` | 使用主题色加粗突出关键字 | `\texthl{RTL 设计}` |
| `skilllist` | 技能清单列表环境 | `\begin{skilllist} ... \end{skilllist}` |

默认一页包含**教育背景、实习经历、项目经历、专业技能、课程设计、荣誉奖项**。每个板块从 `\sectionTitle` 开始，可整段移动或删除。文件末尾另有技术作品和科研经历的完整注释示例，可用来替换与目标岗位关联较弱的板块。

### 3. 外观与版式调整

- **配色**：在 `resume-zh_CN.tex` 修改 `\definecolor{fgcolor}{HTML}{2B579A}` 调整姓名、模块标题、分隔细线与列表圆点颜色；修改 `secondary` 调整联系方式、日期与技术关键词的深灰色。
- **页边距**：在 `resume-zh_CN.tex` 修改 `\geometry{a4paper,...}`。
- **字号与间距**可在 `resume.cls` 调整。正文为 10pt，段内基线距约 14pt。板块标题为 13pt，条目标题为 11.5pt，两级标题的前后留白分别为 8pt / 5pt 和 7pt / 3pt。普通列表和技能列表共用相同的间距，列表上下各留 3pt，相邻要点之间加 2pt。
- **自定义网站文案**：默认页眉调用 `\website{\resumewebsite}` 直接显示网址；如需自定义显示文本，也可手动调用 `\website[个人博客]{https://example.com}`。

## 常见问题

- **Overleaf 编译报错（如提示 `fontspec` / `xeCJK` 需要 XeLaTeX）**
  请在左上角 **Menu → Compiler** 中将编译器从 `pdfLaTeX` 切换为 **XeLaTeX**，并选择包含 `fontawesome6` 的 TeX Live 版本。
- **正文中包含 `%`、`_`、`&`、`#` 导致报错或截断**
  在 LaTeX 中需分别转义为 `\%`、`\_`、`\&`、`\#`（邮箱或 GitHub 用户名中包含下划线时也需写作 `\_`）。
- **内容略微超出单页**
  可适度减小 `resume-zh_CN.tex` 中 `\geometry` 的上下边距，或在 `resume.cls` 中微调 `\linespread`、`\titlespacing*` 与 `itemize` 的 `itemsep`。
- **更换其他中文字体**
  在 `stys/fonts.tex` 中修改 `\setCJKmainfont`；如改用商业或第三方字体，请按对应字体许可核对 PDF 嵌入与再分发条件。

## 维护与预览更新

<details>
<summary>展开查看：刷新示例 PDF、预览图与 CI 检查说明</summary>

展示入口 `examples/preview.tex` 复用主文件的内容与样式，指定 `images/photo-placeholder.png` 为示意图。修改模板后可在仓库根目录刷新展示文件。

- **Linux / macOS**：执行 `make preview` 可自动重新编译展示版、更新 `examples/resume.pdf` 并生成 `images/preview.png`。
- **手动刷新与文本检查**（需安装 Poppler；提取中文通常需 `poppler-data` 提供 Adobe-GB1 字符映射）：

```sh
latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -outdir=build -jobname=preview examples/preview.tex
cp build/preview.pdf examples/resume.pdf
pdftoppm -singlefile -r 144 -png build/preview.pdf images/preview
pdftotext -layout -enc UTF-8 build/preview.pdf -
```

仓库的 GitHub Actions（[.github/workflows/example.yml](.github/workflows/example.yml)）会在每次推送或 PR 时编译无照片的默认样例、带人物框的展示版及带个人照片、GitHub 和主页字段的用例，校验页数、嵌入图片数量与关键文本，并上传 `build/resume.pdf` 构建产物。

</details>

## 来源与致谢

基于 [luooofan/resume](https://github.com/luooofan/resume/tree/874173fdf343941169e7f673f4344c075fc85422) 的 `zh_CN` 分支精简重构，早期灵感源自 [billryan/resume](https://github.com/billryan/resume)。本仓库保留了 `default` 样式的深蓝色标题与通栏细线、字号层级、左右页边距及右对齐日期，移除了多套冗余样式、原示例资料与随仓库打包的字体文件，改为照片与无照片模式共用同一份正文，并直接调用 TeX 发行版内置字体与图标宏包。

## 授权与字体

模板源码沿用上游 MIT 许可证，原始许可文本见 [LICENSE](LICENSE)。仓库使用 TeX 发行版安装的开源字体；各字体与宏包的授权如下：

| 用途 | 字体 / 宏包 | 授权 |
| --- | --- | --- |
| 中文正文、标题、斜体 | Fandol 宋、黑、楷 | GPL，附字体例外（见 [Fandol 说明](https://mirrors.ctan.org/fonts/fandol/README)） |
| 西文与数字 | TeX Gyre Termes | [GUST Font License](https://ctan.org/pkg/tex-gyre) |
| 标题与联系方式图标 | Font Awesome 6 Free | 字体为 SIL OFL 1.1，LaTeX 宏包为 LPPL 1.3c（见 [fontawesome6 说明](https://ctan.org/pkg/fontawesome6)） |

上游默认使用 Adobe 中文字体并随仓库分发图标字体文件；本版通过 `stys/fonts.tex` 保留宋体正文、黑体强调、楷体专业与学历的分工，直接调用发行版中的字体与图标宏包。自选其他字体时，请按该字体的许可核对 PDF 嵌入与字体文件再分发条件。
