\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/11/23 Chinese technical resume]
\LoadClass[10pt]{article}

\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{graphicx}

\RequirePackage{fontawesome6}
\RequirePackage{hyperref}
\RequirePackage{bookmark}
\RequirePackage{accsupp}
\hypersetup{hidelinks}
\input{stys/fonts.tex}

% 10pt 正文沿用 article 的 12pt 基线，再适度放宽中文续行。
\linespread{1.14}
\setlength{\parindent}{0pt}
\pagestyle{empty}
\setlist{noitemsep}
\setlist[itemize]{topsep=3pt,partopsep=0pt,itemsep=2pt,parsep=0pt,leftmargin=1.25pc,label=\textcolor{fgcolor}{\textbullet}}

% 上游 default：大号蓝色标题，下方一条同色通栏细线。
\titleformat{\section}
  {\fontsize{13pt}{15.5pt}\selectfont\bfseries\raggedright\color{fgcolor}}{}{0em}{}
  [\titleline{\color{fgcolor}\titlerule}]
\titlespacing*{\section}{0pt}{8pt}{5pt}
\titleformat{\subsection}{\fontsize{11.5pt}{14pt}\selectfont\raggedright}{}{0em}{}
\titlespacing*{\subsection}{0pt}{7pt}{3pt}

\newenvironment{skilllist}{\begin{itemize}}{\end{itemize}}
\newcommand{\icon}[1]{\makebox[1em][c]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}\hspace{0.3em}}
\newcommand{\sectionTitle}[2]{\section[#1]{\icon{#2} #1}}
\newcommand{\datedsubsection}[2]{\subsection[#1]{#1 \hfill \mbox{\small\textcolor{secondary}{#2}}}}
\newcommand{\datedline}[2]{\par #1 \hfill \mbox{\small\textcolor{secondary}{#2}}\par}
\newcommand{\texthl}[1]{\textcolor{fgcolor}{\textbf{#1}}}
\newcommand{\normalline}[1]{\par #1\par}
\newcommand{\role}[2]{\par{\color{secondary}\textit{#1}\quad #2}\par\addvspace{2pt}}

\newcommand{\basicInfoItem}[2]{{\normalsize\color{secondary}\icon{#1}\ #2}}
\newcommand{\phone}[1]{\basicInfoItem{\faPhone}{#1}}
\newcommand{\email}[1]{\basicInfoItem{\faEnvelope}{\href{mailto:#1}{#1}}}
\newcommand{\github}[1]{\basicInfoItem{\faGithub}{\href{https://github.com/#1}{github.com/#1}}}
\newcommand{\website}[2][]{\basicInfoItem{\faGlobe}{\href{#2}{\if\relax\detokenize{#1}\relax#2\else#1\fi}}}
\newcommand{\contactsep}{\hspace{0.65em}}
\newif\ifshowphoto
\newlength{\photowidth}
\newlength{\photoheight}
