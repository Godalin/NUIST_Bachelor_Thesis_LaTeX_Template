\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nuist}[Nuist Bachelor Thesis Template v.2024]

% 基于LaTeX的标准文档类型ctexart
\LoadClass[a4paper,zihao=-4,UTF8,fontset=windows]{ctexart}

\RequirePackage{xeCJK}          % 中文支持
\RequirePackage{ulem}           % 文字下划线等样式

% word 兼容性命令
% 使用这些命令可以很方便地模拟 word 使用者常用的间距
\newcommand{\emptyline}[1]{{\zihao{#1}~}}

% 设置页边距
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm} % ,headsep=12pt,headheight=20pt,footskip=24pt
% 设定页眉为空
\pagestyle{plain}


% 设置各种字体
\setCJKmainfont[AutoFakeBold,AutoFakeSlant]{SimSun} % 设置宋体

\setCJKfamilyfont{localsimsun}[AutoFakeBold,AutoFakeSlant]{SimSun}
\renewcommand{\songti}{\CJKfamily{localsimsun}}

\setCJKfamilyfont{localheiti}[AutoFakeBold,AutoFakeSlant]{SimHei}
\renewcommand{\heiti}{\CJKfamily{localheiti}}

\setCJKfamilyfont{localkaishu}[AutoFakeBold,AutoFakeSlant]{KaiTi}
\renewcommand{\kaishu}{\CJKfamily{localkaishu}}

\setmainfont{Times New Roman}
\setmonofont{Times New Roman}
% \RequirePackage{times}
% 其他的一些数学字体，可酌情使用
% \RequirePackage{unicode-math}
% \setmathfont{Cambria Math}
% \setmathfont{Latin Modern Math}

% 列表
\RequirePackage{enumerate}

% 设置脚注格式
\renewcommand{\thefootnote}{\arabic{footnote}〕}

% 行距
\linespread{1.625}
% 1.5倍行距：此处注意行距的换算
% 1.5 ∗ 1.3 / 1.2 = 1.625
% 参考 https://blog.csdn.net/weixinhum/article/details/104594454
% 临时行距变换使用 {\linespread{xxx}\selectfont ... \par}, 参考 lshort

% 算法伪代码
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

% 程序代码
\RequirePackage{listings}
\lstset{basicstyle=\zihao{5}\ttfamily,flexiblecolumns,}
\RequirePackage{tcolorbox}
\tcbuselibrary{listings}

% 颜色
\RequirePackage{xcolor}
\RequirePackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,urlcolor=black]{hyperref}
% 第三版修订者留下的提醒：如果标题百分号 % 和汉字同时出现，则会报错。推荐最后打开

% 图
\RequirePackage{graphicx}
\graphicspath{{./figs/color/}}  % 图片默认文件夹
% 子图
\RequirePackage{subfigure}
\renewcommand{\thesubfigure}{（\alph{subfigure}）}
% 将子图序号设置为（a）

% 表
\RequirePackage{booktabs}         % 设置表格样式，可使用“三线表”
\RequirePackage{multirow}         % 表格合并单元格
\RequirePackage{longtable}        % 跨页表格
\renewcommand{\arraystretch}{1.5} % 表格行距

% 公式
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bm} % 方便的公式加粗

% 公式序号使用中文括号
\RequirePackage{mathtools}
\newtagform{brackets}{（}{）}
\usetagform{brackets}

% 图注表注字号
\RequirePackage{caption}
\renewcommand{\captionfont}{\songti\zihao{5}}
\renewcommand{\captionlabelfont}{}
\captionsetup{labelsep=space}

% 图、表、公式编号与章节关联
\numberwithin{figure}{section}
\numberwithin{table}{section}
\numberwithin{equation}{section}

% 其他不常用包
\RequirePackage{xltxtra}        % 用于输出 \LaTeX 等
\RequirePackage{shapepar}       % 用于原作者致谢里的 \heartpar，可删除
% \RequirePackage{fancyhdr}
% \RequirePackage{lastpage}
% \RequirePackage{layout}

% 章节标题格式
\ctexset{
  section       = {
    format      = {\zihao{4}\heiti\raggedright}
  },
  subsection    = {
    format      = {\zihao{-4}\heiti\raggedright}
  },
  subsubsection = {
    format      = {\zihao{-4}\songti\raggedright}
  },
  paragraph     = {
    format      = {\zihao{-4}\songti\raggedright},
    runin       = false,
    afterskip   = {1.5ex\@plus .2ex}
  } % 修正标题不换行的设置和段后间距
}



% 目录样式的设置
\RequirePackage{titletoc}

\titlecontents{section}
[0em]{\color{black}\zihao{4}\heiti\addvspace{0.5ex}}
{\thecontentslabel\hspace*{1em}}{} % \hspace*{-2.3em}
{\titlerule*[0.4pc]{.}\contentspage}

\titlecontents{subsection}
[2em]{\color{black}\normalsize\addvspace{0.5ex}}
{\thecontentslabel\hspace*{1em}}{\hspace*{-2.3em}}
{\titlerule*[0.4pc]{.}\contentspage}

\titlecontents{subsubsection}
[4em]{\color{black}\normalsize\addvspace{0.5ex}}
{\thecontentslabel\hspace*{1em}}{\hspace*{-2.3em}}
{\titlerule*[0.4pc]{.}\contentspage}



% 2024版修订者：新版本使用 biblatex 进行文献管理，
% 这是更流行的做法 ;)
\RequirePackage[backend=biber,style=gb7714-2015,gbnoauthor=true,gbnamefmt=lowercase]{biblatex}
\defbibheading{myBibHeadingStyle}{
  \pdfbookmark[1]{参考文献}{bookmark:参考文献}
  \cftaddtitleline{toc}{section}{参考文献}{\thepage}
  \heiti\zihao{4}{参考文献：}
}
% \newcommand{\makereference}{
%   \printbibliography
%   % \printbibliography[heading=myBibHeadingStyle]
% }



%%%%%%%%%% 格式命令 %%%%%%%%%%
% 论文封面
% #1: 题目
% #2: 学生姓名
% #3: 学号
% #4: 专业
% #5: 学院
% #6: 指导老师
% #7: 日期
\newcommand{\cover}[7]{
  \begin{titlepage}
    {\zihao{-4}\songti 单位代码：\underline{~~~~10300~~~~}}
    \vspace*{2ex}
    \begin{center}
      \includegraphics[scale=1]{./nuist_logo/nuist_zh_2024.png}

      \emptyline{5}

      {\bfseries\heiti\zihao{1}本科毕业论文/设计（择其一）}

      \emptyline{5}

      \includegraphics[scale=1]{nuist_logo/logo2024.png}

      \emptyline{5}

      \zihao{-2}{\heiti 题目}
      \underline{\parbox[b]{130mm}{
          \centering\linespread{1}\selectfont #1
        }}

      \emptyline{5}

      \zihao{-3}\heiti{学生姓名：}
      \uline{\parbox[b]{58mm}{\center{#2}}}
      \hfill

      \zihao{-3}\heiti{学~~~~~~~~号：}
      \uline{\parbox[b]{58mm}{\center{#3}}}
      \hfill

      \zihao{-3}\heiti{专~~~~~~~~业：}
      \uline{\parbox[b]{58mm}{\center{#4}}}
      \hfill

      \zihao{-3}\heiti{学~~~~~~~~院：}
      \uline{\parbox[b]{58mm}{\center{#5}}}
      \hfill

      \zihao{-3}\heiti{指导教师：}
      \uline{\parbox[b]{58mm}{\center{#6}}}
      \hfill

      \emptyline{-2}

      {\zihao{-3}\songti #7}
    \end{center}
  \end{titlepage}
}



% 文献翻译封面
% #1: 英文题目 （自行调整字体大小和分行）
% #2: 中文题目
% #3: 学生姓名
% #4: 学号
% #5: 专业
% #6: 学院
% #7: 指导老师
% #8: 日期
\newcommand{\covertrans}[8]{
  \begin{titlepage}
    {\zihao{-4}\songti 单位代码：\underline{~~~~10300~~~~}}
    \vspace*{2ex}
    \begin{center}
      \includegraphics[scale=1]{./nuist_logo/nuist_zh_2024.png}

      \emptyline{5}

      {\bfseries\heiti\zihao{1}本科毕业设计英文翻译}

      \emptyline{5}

      \includegraphics[scale=1]{nuist_logo/logo2024.png}

      \emptyline{5}

      \zihao{-2}{\heiti 原文题目}
      \underline{\parbox[b]{130mm}{
          \centering\linespread{1}\selectfont #1
        }}

      \vspace*{2ex}

      \zihao{-2}{\heiti 译文题目}
      \underline{\parbox[b]{130mm}{
          \centering\linespread{1}\selectfont #2
        }}

      \emptyline{5}

      \zihao{-3}\heiti{学生姓名：}
      \uline{\parbox[b]{58mm}{\center{#3}}}
      \hfill

      \zihao{-3}\heiti{学~~~~~~~~号：}
      \uline{\parbox[b]{58mm}{\center{#4}}}
      \hfill

      \zihao{-3}\heiti{专~~~~~~~~业：}
      \uline{\parbox[b]{58mm}{\center{#5}}}
      \hfill

      \zihao{-3}\heiti{学~~~~~~~~院：}
      \uline{\parbox[b]{58mm}{\center{#6}}}
      \hfill

      \zihao{-3}\heiti{指导教师：}
      \uline{\parbox[b]{58mm}{\center{#7}}}
      \hfill

      \emptyline{-2}

      {\zihao{-3}\songti #8}
    \end{center}
  \end{titlepage}
}



% 声明页
\RequirePackage{enumerate}
\newcommand{\makestatement}{{
  \begin{center}
    \heiti\zihao{-2}
    \color{red}{郑\quad{}重\quad{}声\quad{}明}
  \end{center}

  \kaishu\zihao{-4}
  本人以“求实~创新”的科学精神从事科学研究工作，所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。本论文尽我所知，所有测试、数据和相关材料均为真实有效；文中除引文和致谢内容外，未抄袭其他人或其他机构已经发表或撰写过的研究成果。与我一同工作同志对本研究所做的贡献均已在论文中作了声明并表示谢意。

  本人毕业论文及涉及相关资料若有不实，愿意承担一切相关的法律责任。

  \zihao{5}~

  \songti\zihao{-4}
  论文作者签名：\underline{\makebox[7em]{}}
  \hspace{4em}
  签字日期：\underline{\makebox[7em]{}}

  \zihao{5}~\\~\\~\\

  \begin{center}
    \heiti\zihao{-2}
    \color{red}{论文使用授权说明}
  \end{center}

  \kaishu\zihao{-4}
  本人授权南京信息工程大学可以保留并向国家有关部门或机构送交论文的复印件和电子文档；允许论文被查阅和借阅；可以将学位论文的全部或部分内容编入有关数据库进行检索；可以采用影印、缩印或扫描等复制手段保存、汇编本学位论文。不可用于任何非法用途。本文电子文档的内容和纸质论文的内容相一致。论文的公布（包括刊登）授权南京信息工程大学教务处办理。

  \zihao{5}~

  \songti\zihao{-4}
  论文作者签名：\underline{\makebox[7em]{}}
  \hspace{4em}
  签字日期：\underline{\makebox[7em]{}}

  指导老师签名：\underline{\makebox[7em]{}}
  \hspace{4em}
  签字日期：\underline{\makebox[7em]{}}

  \clearpage
}}



% 目录页
\newcommand{\mytableofcontents}{{
    \renewcommand{\contentsname}{
      \begin{center}
        \zihao{3}\heiti
        目\quad{}\quad{}录
      \end{center}

      % {\zihao{5}~}% \vspace*{-4.5em}
    }
    \tableofcontents

    \clearpage
  }}



% 摘要页中文标题
% #1: 论文题目
% #2: 作者
% #3: 学院
\newcommand{\maketitleofchinese}[3]{{
    \begin{center}
      \zihao{3}\heiti #1\\
      \zihao{5}~\\
      \zihao{4}\songti #2\\
      \zihao{5}南京信息工程大学#3学院，江苏~南京~210044\\
    \end{center}
  }}

% 翻译摘要页中文标题
% #1: 论文题目
% #2: 作者
% #3: 学院
\newcommand{\maketitleofchinesetrans}[3]{{
    \begin{center}
      \zihao{3}\heiti #1\\
      \zihao{5}~\\
      {\zihao{-4}\bfseries\songti #2}\\
      {\zihao{5}#3}\\
    \end{center}
  }}


% 摘要页中文摘要
% #1: 摘要
% #2: 关键词
\newcommand{\abstractofchinese}[2]{{
    {\linespread{1.625}\selectfont
      \noindent{\zihao{-4}\heiti 摘要：}{\zihao{-4}\kaishu #1}\par}
    \noindent{\zihao{-4}\heiti 关键词：}{\zihao{-4}\kaishu #2}
    \clearpage
  }}



% 摘要页英文标题
% #1: 论文题目
% #2: 作者
% #3: 学院
\newcommand{\maketitleofenglish}[3]{{
    \begin{center}
      \zihao{3}\textbf{#1}\\
      \zihao{5}~\\
      \zihao{4} #2\\
      \zihao{5} #3，NUIST，Nanjing 210044，China\\
    \end{center}
  }}

% 摘要页英文摘要
% #1: 摘要内容
% #2: 关键词
\newcommand{\abstractofenglish}[2]{{
  \noindent{\zihao{-4}\textbf{Abstract：}}{\zihao{5} #1}\par
  \noindent{\zihao{-4}\textbf{Key words：}}{\zihao{5} #2}
  \clearpage
}}



% 致谢标题
% #1: 致谢内容
\newcommand{\thanking}[1]{{
  \begin{center}
    \zihao{4}\heiti 致\quad{}谢
  \end{center}
  \phantomsection
  \addcontentsline{toc}{section}{致谢}

  \zihao{5}~

  \zihao{5}\kaishu #1
  \clearpage
}}
%%%%%%%%%% 格式命令 %%%%%%%%%%
