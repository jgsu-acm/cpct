\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ctsol}[2022/05/03 v1.1 Contest Solution Template document class]

\LoadClass[lang=cn,color=blue]{elegantbook}

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

\newcounter{solamo}
\newcommand{\addsolution}[3]
{
    \stepcounter{solamo}
    \labeltext{#1}{pro:\thesolamo}
    \labeltext{#2}{aut:\thesolamo}
    \labeltext{#3}{ans:\thesolamo}
}

\newcounter{solcnt}
\newcommand{\makesolution}
{
    \stepcounter{solcnt}
    \ifnum \value{solcnt}>\value{solamo}
        \PackageError{ctsol}
        {
            You don't have enough solutions, you only have \thesolamo solutions!
            Check if you are using makesolution too many times
        }
    \fi
    \chapter{\ref*{pro:\thesolcnt}}
}

\newcolumntype{M}{>{\centering\arraybackslash}X}

\newcommand{\solutiontab}
{
    \begin{center}
        \begin{tabularx}{\textwidth}{MMMM}
            \toprule
            \textbf{题目编号} & \textbf{题目名称} & \textbf{命题人} & \textbf{做法} \\
            \midrule
        \end{tabularx}
    
        \newcounter{i}
        \setcounter{i}{1}
        \whiledo{\value{i}<\numexpr\value{solamo}+1\relax}
        {
            \begin{tabularx}{\textwidth}{MMMM}
                \Alph{i} & \ref*{pro:\thei} & \ref*{aut:\thei} & \ref*{ans:\thei} \\
                \ifnum \value{i}=\value{solamo}
                    \bottomrule
                \fi
            \end{tabularx}
            \stepcounter{i}
        }
    \end{center}
}

\newcommand{\stdpath}{../std/}

\newcommand{\std}[1]
{
    \lstinputlisting
    [
        language=c++,
        frame=none,
        numbers=left,
        breaklines=true,
        xleftmargin=.25in,
        xrightmargin=.25in,
        basicstyle=\ttfamily\scriptsize
    ]{\stdpath #1.cpp}
}
