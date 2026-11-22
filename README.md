# 中文技术简历模板

面向电子信息、数字 IC 设计与计算机体系结构岗位的单页 A4 简历。默认展示教育背景、专业技能和两个标明“虚构示例”的项目，右上方预留证件照位置。

![由默认配置实际编译的简历预览](images/preview.png)

## 来源与修改

基于 luooofan 的中文分支 `zh_CN`，上游源自 billryan 的简历模板。本版保留 default 的深蓝色标题与细横线、字号层级、页边距和右对齐日期，移除了其他标题样式、原个人资料、演示图片和参考文献。照片与无照片模式共用同一份正文，字体和图标由 TeX 发行版提供。[上游源码快照](https://github.com/luooofan/resume/tree/874173fdf343941169e7f673f4344c075fc85422) · [早期原作](https://github.com/billryan/resume)

## 编译

使用 XeLaTeX。已在 Windows 上使用 TeX Live 2026 验证。完整 TeX Live 包含所需字体及宏包；精简安装应具备 `fontspec`、`xeCJK`、`fontawesome6`、`tabularray`、`graphicx`、`geometry`、`xcolor`、`titlesec`、`enumitem`、`hyperref`、`bookmark`、`accsupp` 以及下表中的字体。命令均在项目根目录执行。

**Linux / macOS** 使用 GNU Make 和 latexmk。运行 `make` 或 `make zh_CN` 生成 `build/resume.pdf`。`make clean` 清理该主文件的编译缓存和 PDF。日志及辅助文件均写入 `build/`。

**Windows** 在 PowerShell 中直接执行 Makefile 使用的同一条命令。latexmk 会创建输出目录，并按需重复运行 XeLaTeX。

```powershell
latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build -jobname=resume resume-zh_CN.tex
```

**Overleaf** 将项目源码压缩为 ZIP 并上传，保留目录结构。将 Main document 设为 `resume-zh_CN.tex`，在项目的 Compiler 设置中选择 **XeLaTeX**，并选择包含 `fontawesome6` 的 TeX Live 版本。点击 Recompile，随后可从页面下载 PDF。[Overleaf 编译设置](https://docs.overleaf.com/getting-started/recompiling-your-project/selecting-a-tex-live-version-and-latex-compiler)

## 项目结构

```text
latex-resume-template/
├── resume-zh_CN.tex           主文件、个人信息和外观参数
├── resume.cls                 标题、日期、列表及联系方式的排版
├── texs/
│   ├── header_with_photo.tex  页眉、照片与占位框
│   └── sections.tex           教育、技能、项目及可选模块
├── stys/fonts.tex             中西文字体及字形映射
├── images/preview.png         默认 PDF 的实际预览
├── build/resume.pdf           本地编译产物，Git 忽略本目录
├── Makefile
├── .gitignore
├── README.md
└── LICENSE
```

## 填写简历

- **个人信息**　在 `resume-zh_CN.tex` 修改 `\resumename`、`\resumedirection`、`\resumephone`、`\resumeemail` 和 `\githubuser`。GitHub 只填用户名，页眉会生成完整链接。LaTeX 正文中的百分号、下划线及 & 分别写作 `\%`、`\_`、`\&`。
- **证件照**　将照片保存为 `images/photo.jpg` 或 `images/photo.png`，重新编译即可。同名时 JPG 优先。照片在 **22.5 × 30 mm** 的区域内居中等比缩放，完整保留原图；横图或窄图的余处留白。无文件时显示灰色占位框。路径前缀（不含扩展名）、宽高分别由 `\photopath`、`\photowidth`、`\photoheight` 控制。改为 `\showphotofalse` 可隐藏照片。
- **教育背景**　在 `texs/sections.tex` 复制一组 `\datedsubsection{院校 / 专业 / 学历}{起止年月}` 及其下方的 `\normalline{...}`。自由增删方向、绩点和课程行。
- **专业技能**　在 `skilllist` 中按实际能力增删 `\item`。填写完毕后可删除标题中的“（示例）”。
- **项目经历**　复制一个项目，从 `\datedsubsection` 到 `\end{itemize}`。填写项目名和日期，用 `\role{技术关键词}{角色或分工}` 说明自己的职责，再写项目简介、具体工作和可核实的成果。替换完整条目后移除“虚构示例”。
- **增删模块**　按 `\sectionTitle{模块名}{图标}` 移动或删除整个区块。文件末尾提供实习、科研和荣誉的注释骨架。

## 排版与预览

在主文件中编辑 `\definecolor{fgcolor}{HTML}{01408F}` 可同步调整标题、横线与院校强调色；`\geometry{...}` 控制纸张与四边边距。在 `resume.cls` 中，`\LoadClass[11pt]{article}` 控制基础字号，`\titleformat` 控制标题层级，`\titlespacing*` 和 `\setlist` 控制段落之间的标题与列表间距。姓名字号在页眉的 `row{1}` 中设置。

用 Poppler 可刷新预览或检查复制顺序。中文提取需使用含 Adobe-GB1 字符映射的工具，Linux 发行版通常通过 `poppler-data` 提供该数据。

```sh
pdftoppm -singlefile -r 144 -png build/resume.pdf images/preview
pdftotext -layout -enc UTF-8 build/resume.pdf -
```

## 授权与字体

模板源码沿用上游 MIT 许可证，原始许可文本见 [LICENSE](LICENSE)。仓库使用 TeX 发行版安装的字体；字体文件各自的授权如下。

| 用途 | 字体 | 授权 |
| --- | --- | --- |
| 中文正文、标题、斜体 | Fandol 宋、黑、楷 | GPL，附字体例外。见 [Fandol 说明](https://mirrors.ctan.org/fonts/fandol/README) |
| 西文与数字 | TeX Gyre Termes | [GUST Font License](https://ctan.org/pkg/tex-gyre) |
| 标题与联系方式图标 | Font Awesome 6 Free | 字体为 SIL OFL 1.1，LaTeX 宏包为 LPPL 1.3c。见 [宏包与字体许可](https://ctan.org/pkg/fontawesome6) |

上游默认使用 Adobe 中文字体，另有 Noto 宋体、黑体两组可选配置，图标依赖随仓库分发的 Font Awesome 字体及生成的宏文件。本版以 `stys/fonts.tex` 保留宋体正文、黑体强调、楷体专业与学历的分工，直接调用发行版的图标宏包。自选其他字体时，请按该字体的许可核对 PDF 嵌入与字体文件再分发条件。
