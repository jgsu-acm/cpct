\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ctpro}[2022/05/03 v1.1 Contest Problem Template document class]

\LoadClass[lang=cn,color=green]{elegantbook}

\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{sourcecodepro}

\renewcommand{\thechapter}{\Alph{chapter}.}
\renewcommand{\chaptername}{\thechapter}
\renewcommand{\xchaptertitle}{\chaptername}

\makeatletter
\renewcommand{\maketitle}
{
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        {
            \LARGE
            \textbf{\@title}
            \par
        }
        \vspace{0.5cm}
        \@date
    \end{center}
}

\newcommand{\labeltext}[2]
{
    \@bsphack
    \csname phantomsection \endcsname
    \def\@currentlabel{#1}{\label{#2}}
    \@esphack
}
\makeatother

\newcounter{proamo}
\newcommand{\addproblem}[5]
{
    \stepcounter{proamo}
    \labeltext{#1}{pro:\theproamo}
    \labeltext{#2ms}{tim:\theproamo}
    \labeltext{#3M}{mem:\theproamo}
    \labeltext{#4}{typ:\theproamo}
    \labeltext{#5}{aut:\theproamo}
}

\newcounter{procnt}
\newcommand{\makeproblem}
{
    \stepcounter{procnt}
    \ifnum \value{procnt}>\value{proamo}
        \PackageError{ctpro}
        {
            You don't have enough problems, you only have \theproamo problems!
            Check if you are using makeproblem too many times
        }
    \fi
    \chapter{\ref*{pro:\theprocnt}}
    \begin{center}
        运行时间上限：\ref*{tim:\theprocnt} \quad
        运行内存上限：\ref*{mem:\theprocnt} \quad
        题目类型：\ref*{typ:\theprocnt} \quad
        命题人：\ref*{aut:\theprocnt}
    \end{center}
}

\newcolumntype{Z}{>{\centering\arraybackslash}X}
\newcolumntype{I}{>{\hsize=0.7\hsize\linewidth=\hsize}Z}
\newcolumntype{N}{>{\hsize=1.8\hsize\linewidth=\hsize}Z}
\newcolumntype{T}{>{\hsize=0.9\hsize\linewidth=\hsize}Z}
\newcolumntype{M}{>{\hsize=0.9\hsize\linewidth=\hsize}Z}
\newcolumntype{P}{>{\hsize=0.8\hsize\linewidth=\hsize}Z}
\newcolumntype{A}{>{\hsize=0.9\hsize\linewidth=\hsize}Z}

\newcommand{\ctinfotab}[3]
{
    \begin{center}
        \begin{tabularx}{\textwidth}{MMMM}
            \toprule
            \textbf{赛制} & \textbf{语言} & \textbf{时长} & \textbf{题目数量} \\
            \midrule
            #1 & #2 & #3 小时 & \theproamo \\
            \bottomrule
        \end{tabularx}
    \end{center}
}

\newcommand{\problemtab}
{
    \begin{center}
        \begin{tabularx}{\textwidth}{INTMPA}
            \toprule
            \textbf{题目编号} & \textbf{题目名称} & \textbf{运行时间上限} & \textbf{运行内存上限} & \textbf{题目类型} & \textbf{命题人} \\
            \midrule
        \end{tabularx}
    
        \newcounter{i}
        \setcounter{i}{1}
        \whiledo{\value{i}<\numexpr\value{proamo}+1\relax}
        {
            \begin{tabularx}{\textwidth}{INTMPA}
                \Alph{i} & \ref*{pro:\thei} & \ref*{tim:\thei} & \ref*{mem:\thei} & \ref*{typ:\thei} & \ref*{aut:\thei} \\
                \ifnum \value{i}=\value{proamo} \bottomrule \fi
            \end{tabularx}
            \stepcounter{i}
        }
    \end{center}
}

\newcounter{casecnt}[chapter]
\newcommand{\testcasetab}[2]
{
    \stepcounter{casecnt}
    \begin{center}
        \begin{tabularx}{\textwidth}{X|X}
            \toprule
            输入样例 \thecasecnt & 输出样例 \thecasecnt \\
            \midrule
            \ttfamily #1 & \ttfamily #2 \\
            \bottomrule
        \end{tabularx}
    \end{center}
}

\lstset{language=C++}
