\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/11/23 Chinese technical resume]
\LoadClass[11pt]{article}

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

\linespread{1.12}
\setlength{\parindent}{0pt}
\pagestyle{empty}
\setlist{noitemsep}
\setlist[itemize]{topsep=2pt,partopsep=0pt,itemsep=0.24em,leftmargin=1.25pc,label=\textcolor{fgcolor}{\textbullet}}

% 上游 default：大号蓝色标题，下方一条同色通栏细线。
\titleformat{\section}
  {\fontsize{13.5pt}{16pt}\selectfont\bfseries\raggedright\color{fgcolor}}{}{0em}{}
  [\titleline{\color{fgcolor}\titlerule}]
\titlespacing*{\section}{0pt}{9pt}{4pt}
\titleformat{\subsection}{\large\raggedright}{}{0em}{}
\titlespacing*{\subsection}{0pt}{6pt}{2pt}

\newenvironment{skilllist}{\begin{itemize}[itemsep=0.25em]}{\end{itemize}}
\newcommand{\icon}[1]{\makebox[1em][c]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}\hspace{0.3em}}
\newcommand{\sectionTitle}[2]{\section[#1]{\icon{#2} #1}}
\newcommand{\datedsubsection}[2]{\subsection[#1]{#1 \hfill \mbox{\small\textcolor{secondary}{#2}}}}
\newcommand{\datedline}[2]{\par #1 \hfill \mbox{\small\textcolor{secondary}{#2}}\par}
\newcommand{\texthl}[1]{\textcolor{fgcolor}{\textbf{#1}}}
\newcommand{\normalline}[1]{\par #1\par}
\newcommand{\role}[2]{\par{\color{secondary}\textit{#1}\quad #2}\par\addvspace{1pt}}

\newcommand{\basicInfoItem}[2]{{\normalsize\color{secondary}\icon{#1}\ #2}}
\newcommand{\phone}[1]{\basicInfoItem{\faPhone}{#1}}
\newcommand{\email}[1]{\basicInfoItem{\faEnvelope}{\href{mailto:#1}{#1}}}
\newcommand{\github}[1]{\basicInfoItem{\faGithub}{\href{https://github.com/#1}{github.com/#1}}}
\newcommand{\website}[2][]{\basicInfoItem{\faGlobe}{\href{#2}{\if\relax\detokenize{#1}\relax#2\else#1\fi}}}
\newcommand{\contactsep}{\hspace{0.65em}}
\newif\ifshowphoto
\newlength{\photowidth}
\newlength{\photoheight}
