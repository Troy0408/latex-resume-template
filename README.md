# 广东工业大学集成电路学院简历模板（XeLaTeX）

[![Build Status](https://github.com/Troy0408/latex-resume-template/actions/workflows/example.yml/badge.svg)](https://github.com/Troy0408/latex-resume-template/actions/workflows/example.yml)
[![License: MIT](https://img.shields.io/github/license/Troy0408/latex-resume-template)](LICENSE)
![XeLaTeX](https://img.shields.io/badge/Engine-XeLaTeX-2B579A)
[![Overleaf Ready](https://img.shields.io/badge/Overleaf-Ready-47A141)](#方式一overleaf-在线编辑推荐零配置)

面向**广东工业大学集成电路学院**学生设计的单页 A4 XeLaTeX 简历模板，同时适用于**毕业生校招、在校找实习、课题组/实验室面试、学院学生部门或社团纳新**等多元场景，其他工科专业亦可直接改用。支持 Overleaf 在线编辑与本地编译，直接调用 TeX Live 内置开源字体，默认附带一套广工集成电路学院本科生虚构示例（[examples/resume.pdf](examples/resume.pdf)）。

| <a href="examples/resume.pdf"><img src="images/preview.png" alt="广东工业大学集成电路学院单页中文技术简历预览，个人信息右侧为灰色可选证件照示意图" width="660" /></a> |
| :---: |

[在线查看 / 下载示例 PDF](examples/resume.pdf) · 个人基本信息**不内置「求职意向」**，同一份底稿可灵活投递校招、实习或校内部门；右上角灰色「可选证件照」仅用于展示版式，直接编译主文件时只有放入个人照片才会显示照片栏。示例中的姓名、GPA、公司、项目及奖项均为虚构。

## 模板特点

- **多场景通用，不预设「求职意向」**：页眉仅保留姓名、联系方式、GitHub / 个人主页与可选证件照，避免把岗位名称写死在个人信息栏，方便一套模板同时应对校招、实习、实验室与学生部门面试。
- **贴合广工集成电路学院示例**：默认示例采用广工集成电路学院（`5.0` 制 GPA、学院专业课程、集创赛与芯片设计/验证项目）常见结构；`texs/sections.tex` 末尾还预置了**校园经历、科研经历、技术作品、个人总结**注释模板，按场景取消注释即可替换。
- **开箱即用，免装商业字体**：直接调用 TeX Live 内置的 Fandol 中文字体、TeX Gyre Termes 西文字体与 Font Awesome 6 图标，Overleaf 与本地环境一致。
- **证件照与联系方式自适应**：放入 `images/photo.jpg` / `.jpeg` / `.png` 自动切换带照片页眉（右对齐等比缩放、不裁剪），未放照片或设为 `\showphotofalse` 时自动收起；联系方式留空或误留空格均不显示、不留多余分隔符；`.gitignore` 默认忽略个人照片文件。
- **可检索 PDF 与工程化校验**：主配置、版式类、页眉、正文与字体分文件维护，保留文本与超链接，并通过 GitHub Actions 持续验证单页输出、排版零溢出与中文文本提取。

## 多场景使用建议

模板不限定板块顺序，建议根据当前面试对象调整 `texs/sections.tex` 中的模块顺序与内容侧重：

| 投递场景 | 推荐板块顺序 | 填写重点与调整建议 |
| --- | --- | --- |
| **毕业生校招 / 秋招春招** | 教育背景 → 实习经历 → 项目经历 → 专业技能 → 课程设计 / 荣誉奖项 | 突出实习产出、芯片/系统流片或仿真项目与工具链；岗位名称可通过 PDF 文件名与靠前项目体现 |
| **在校生找实习** | 教育背景 → 项目经历 → 专业技能 → 课程设计 / 校园经历 → 荣誉奖项 | 尚无企业实习时直接删去「实习经历」，将课程项目、集创赛/电赛或实训项目提至最前 |
| **面试导师课题组 / 保研** | 教育背景 → 科研经历 → 项目经历 → 专业技能 → 荣誉奖项 | 重点写 GPA、专业排名与核心课程成绩，启用文末「科研经历」替换「实习经历」，突出实验复现与文献调研能力 |
| **面试学院部门 / 学生组织** | 教育背景 → 校园经历 → 个人总结 / 项目经历 → 专业技能 → 荣誉奖项 | 启用文末「校园经历」与「个人总结」，精简纯硬件技术细节，突出活动组织、文档排版与跨团队沟通经历 |

> **集成电路学院常见细分方向参考**：
> - **数字 IC 设计 / 验证**：重点保留 Verilog / SystemVerilog、RISC-V、FIFO、Verilator / VCS / Verdi、UVM、Python / Makefile。
> - **模拟 / 射频 IC 设计**：课程可写「模拟集成电路设计、射频集成电路」，工具可写 Cadence Virtuoso、Spectre、HSPICE、ADS，项目侧重运放、LDO、Bandgap、PLL 版图与前后仿真指标。
> - **微电子器件与工艺**：课程可写「半导体物理、半导体器件物理、集成电路工艺原理」，工具可写 Sentaurus TCAD、Silvaco、Origin、SEM/AFM 实验数据分析。
> - **嵌入式 / FPGA**：课程可写「微机原理、嵌入式系统、FPGA 系统设计」，工具可写 C/C++、STM32、Vivado / Quartus、AXI/UART/SPI 外设驱动。

## 快速开始

### 方式一：Overleaf 在线编辑（推荐，零配置）

大多数同学只需要修改 `resume-zh_CN.tex` 和 `texs/sections.tex` 两个文件即可完成个人简历：

1. 点击仓库右上角 **Use this template**（或 **Code → Download ZIP** 下载源码包）。
2. 在 Overleaf 中选择 **New Project → Upload Project** 上传 ZIP（保留目录结构）。
3. 打开左上角 **Menu**，将 **Main document** 设为 `resume-zh_CN.tex`，将 **Compiler** 切换为 **XeLaTeX**，并选择包含 `fontawesome6` 的较新 TeX Live 版本（参考 [Overleaf 编译设置文档](https://docs.overleaf.com/getting-started/recompiling-your-project/selecting-a-tex-live-version-and-latex-compiler)）。
4. 修改 `resume-zh_CN.tex`（个人信息与照片开关）与 `texs/sections.tex`（经历与模块），点击 **Recompile** 下载 PDF。

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

- **VS Code 用户**：安装 **LaTeX Workshop** 插件后打开 `resume-zh_CN.tex`（首行已带 `% !TeX program = xelatex` 魔法注释），即可直接一键编译预览。

> 使用 `-g` 参数会强制重新检查可选照片，新增、删除或替换证件照时也会立即刷新输出；编译日志与辅助文件均写入 `build/`。

## 目录结构

```text
latex-resume-template/
├── resume-zh_CN.tex                # 主文件：个人信息、颜色、边距与照片开关
├── resume.cls                      # 版式类：标题层级、列表样式与联系方式命令
├── texs/
│   ├── header_with_photo.tex       # 页眉布局与可选证件照
│   └── sections.tex                # 教育背景、实习/项目、技能与多场景可选模块
├── stys/
│   └── fonts.tex                   # 中西文字体与实际文本映射设置
├── examples/
│   ├── preview.tex                 # 带灰色证件照示意图的展示入口
│   └── resume.pdf                  # 展示版 PDF
├── images/
│   ├── preview.png                 # README 展示用的示例预览图
│   ├── photo-placeholder.png       # 灰色人物框，仅展示版使用
│   └── photo.{jpg,jpeg,png}        # 个人证件照放置位置（已加入 .gitignore）
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
| `\resumeaddress` | 所在城市或期望地点 | `广州` |
| `\resumephone` | 手机号，留空或删除则不显示 | `1XX-XXXX-XXXX` |
| `\resumeemail` | 邮箱（自动生成 `mailto:` 链接） | `lin.zhiyuan@example.com` |
| `\githubuser` | GitHub 用户名（自动生成 `github.com/用户名`） | 空（不显示） |
| `\resumewebsite` | 个人主页或作品集完整链接（如 `https://...`） | 空（不显示） |
| `\resumewebsitetext` | 可选，自定义个人主页显示文本（不填则显示原链接） | 未定义（显示完整链接） |
| `\showphototrue` / `\showphotofalse` | 控制是否启用页眉右侧证件照 | `\showphototrue` |
| `\photopath` | 证件照路径前缀（不含扩展名） | `images/photo` |
| `\photowidth` / `\photoheight` | 照片展示区域宽高 | `2.25cm` × `3cm` |

将证件照保存为 `images/photo.jpg`、`images/photo.jpeg` 或 `images/photo.png` 后重新编译即可；同名时查找优先级为 `.jpg` > `.jpeg` > `.png`。照片会在 **22.5 × 30 mm** 区域内靠右对齐并等比缩放、完整保留原图、不裁剪。未放置照片或设为 `\showphotofalse` 时，页眉自动收起照片栏。

### 2. 正文内容与常用命令（`texs/sections.tex`）

| 命令 / 环境 | 作用 | 示例 |
| --- | --- | --- |
| `\sectionTitle{模块名}{图标}` | 带 Font Awesome 图标的模块标题与通栏细线 | `\sectionTitle{项目经历}{\faUsers}` |
| `\datedsubsection{标题}{日期}` | 左侧正文标题 + 右侧灰字日期 | `\datedsubsection{\textbf{项目名}}{2026.03 -- 2026.06}` |
| `\datedline{内容}{日期}` | 单行左右对齐条目，适合荣誉奖项 | `\datedline{广东工业大学学业优秀奖学金}{2025.10}` |
| `\role{技术关键词}{分工或角色}` | 标题下方的斜体技术栈与个人分工行 | `\role{Verilog / Verilator}{RTL 与验证}` |
| `\normalline{文字}` | 普通无圆点段落行 | `\normalline{专业方向：数字集成电路设计}` |
| `\texthl{重点词}` | 使用主题色加粗突出关键字 | `\texthl{RTL 设计}` |
| `skilllist` | 技能清单列表环境 | `\begin{skilllist} ... \end{skilllist}` |

默认一页包含**教育背景、实习经历、项目经历、专业技能、课程设计、荣誉奖项**。每个板块从 `\sectionTitle` 开始，可整段移动或删除；文件末尾还预置了**校园经历、科研经历、技术作品、个人总结**的注释示例，按实际投递需求取消注释即可使用。

<details>
<summary>常用板块图标速查（Font Awesome 6）</summary>

| 图标命令 | 适用板块 | 图标命令 | 适用板块 |
| --- | --- | --- | --- |
| `\faGraduationCap` | 教育背景 | `\faMicroscope` | 科研经历 / 实验室 |
| `\faBriefcase` | 实习经历 / 工作经历 | `\faAward` / `\faTrophy` | 荣誉奖项 / 竞赛 |
| `\faUsers` | 项目经历（团队） | `\faPeopleGroup` | 校园经历 / 学生部门 |
| `\faMicrochip` | 芯片 / 硬件项目 | `\faFolderOpen` | 技术作品 / 开源项目 |
| `\faGears` / `\faCode` | 专业技能 | `\faUser` | 个人总结 |
| `\faFlask` | 课程设计 / 实验 | `\faBook` | 论文发表 / 主修课程 |

</details>

### 3. 外观与版式调整

- **配色**：在 `resume-zh_CN.tex` 修改 `\definecolor{fgcolor}{HTML}{2B579A}` 调整姓名、模块标题、分隔细线与列表圆点颜色；修改 `secondary` 调整联系方式、日期与技术关键词的深灰色。常用克制主题色参考：默认深蓝 `#2B579A`、沉稳藏青 `#1F3A5F`、科技深灰 `#334155`。
- **页边距**：在 `resume-zh_CN.tex` 修改 `\geometry{a4paper,...}`。
- **字号与间距**：可在 `resume.cls` 调整。正文为 `10pt`（行距倍数 `1.14`），板块标题为 `13pt`，条目标题为 `11.5pt`，两级标题前后留白分别为 `8pt / 5pt` 与 `7pt / 3pt`；普通列表与技能列表上下各留 `3pt`，相邻要点间隔 `2pt`。

## 实用建议与常见问题

- **保护个人隐私（使用 GitHub 时必读）**
  本仓库为公开模板。如果你基于本模板创建了自己的 GitHub 仓库来存放个人简历，建议将仓库设为 **Private（私有）**，避免个人手机号、邮箱和证件照暴露在公开网络中。
- **投递时的 PDF 文件命名建议**
  模板不在基本信息中写「求职意向」，建议通过文件名直接点明学校与目标岗位/部门，例如：`张三-广东工业大学-数字IC验证工程师.pdf`、`张三-广工集成电路学院-暑期实习.pdf` 或 `张三-学术部干事面试简历.pdf`。
- **Overleaf 编译报错（如提示 `fontspec` / `xeCJK` 需要 XeLaTeX）**
  请在左上角 **Menu → Compiler** 中将编译器从 `pdfLaTeX` 切换为 **XeLaTeX**，并选择包含 `fontawesome6` 的 TeX Live 版本。
- **正文中包含 `%`、`_`、`&`、`#` 导致报错或截断**
  在 LaTeX 中需分别转义为 `\%`、`\_`、`\&`、`\#`（例如 `专业前 15\%`、以及含下划线的邮箱或 GitHub 用户名中的 `\_`）。
- **内容略微超出单页**
  优先精简非目标场景相关的描述；若仅超出 1～2 行，可适度减小 `resume-zh_CN.tex` 中 `\geometry` 的上下边距，或在 `resume.cls` 中微调 `\linespread`、`\titlespacing*` 与 `itemize` 的 `itemsep`。
- **更换其他中文字体**
  在 `stys/fonts.tex` 中修改 `\setCJKmainfont`；如改用商业或第三方字体，请按对应字体许可核对 PDF 嵌入与再分发条件。

## 维护与预览更新

<details>
<summary>展开查看：刷新示例 PDF、预览图与 CI 检查说明</summary>

展示入口 `examples/preview.tex` 复用主文件的内容与样式，指定 `images/photo-placeholder.png` 为示意图。修改模板后可在仓库根目录刷新展示文件。

- **Linux / macOS**：执行 `make preview` 可自动重新编译展示版、更新 `examples/resume.pdf` 并生成 `images/preview.png`。
- **Windows（PowerShell）**：

```powershell
latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build -jobname=preview examples/preview.tex
Copy-Item build/preview.pdf examples/resume.pdf -Force
pdftoppm -singlefile -r 144 -png build/preview.pdf images/preview
pdftotext -layout -enc UTF-8 build/preview.pdf -
```

- **手动文本检查**（需安装 Poppler 与 Adobe-GB1 字符映射数据 `poppler-data`，否则部分环境下中文渲染或提取会缺失）：

```sh
pdftotext -layout -enc UTF-8 build/preview.pdf -
```

仓库的 GitHub Actions（[.github/workflows/example.yml](.github/workflows/example.yml)）会在每次推送或 PR 时编译无照片的默认样例、带人物框的展示版及带个人照片、GitHub 和自定义主页文案的用例，校验单页限制、嵌入图片数量、广工示例关键文本与「求职意向」移除回归，并检查编译日志无 `Overfull` 与缺字警告，同时上传 `build/resume.pdf` 构建产物。

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
