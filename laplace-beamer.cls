\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{laplace-beamer}[13/06/2023 v0.1]

\RequirePackage{graphicx}
\RequirePackage{calc}
\graphicspath{{fig/}}

\RequirePackage{tikz}

\RequirePackage{lipsum}
\usetikzlibrary{decorations.text}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{bending}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.geometric, arrows}

\LoadClass[aspectratio=169]{beamer}
%\LoadClass[]{beamer}

\definecolor{laplaceWhite}{RGB}{255, 255, 255}
\definecolor{laplaceOrange}{RGB}{236, 67, 27}
\definecolor{laplaceBlack}{RGB}{0, 0, 0}
\definecolor{laplaceGray}{RGB}{231, 230, 230}

\mode<presentation>
{
  \useoutertheme{split}
  \setbeamertemplate{navigation symbols}{}
%
 % \usecolortheme{whale}
%  \usecolortheme{orchid}
%  \setbeamerfont{block title}{size={}}
%
%  \useoutertheme{split}
%  \useinnertheme{circles}
  \usefonttheme[onlymath]{serif}
%

  \setbeamercolor{alert}{bg=laplaceOrange}
  \setbeamercolor{palette primary}{bg=laplaceOrange,fg=laplaceBlack}
  \setbeamercolor{palette secondary}{bg=laplaceBlack}
  \setbeamercolor{palette tertiary}{bg=laplaceGray}
  \setbeamertemplate{blocks}[rounded][shadow=true]
  
\makeatletter
\setbeamerfont{title}{series=\bfseries,size=\LARGE}
\setbeamerfont{subtitle}{series=\mdseries,size=\normalsize}
\setbeamerfont{block title}{series=\bfseries,size=\normalsize}
\setbeamercolor{block title}{fg=laplaceOrange,bg=laplaceOrange!10}
\setbeamercolor{block body}{fg=laplaceBlack,bg=laplaceOrange!5}
\setbeamercolor{item}{fg=laplaceOrange}
\setbeamercolor{caption name}{fg=laplaceOrange}
\setbeamercolor{section in toc}{fg=laplaceOrange}
\setbeamerfont{section in toc}{series=\bfseries}

\newcommand{\conferenceLogo}[1][]{\gdef\insertconferencelogo{#1}}
\conferenceLogo{}

\renewcommand{\titlepage}[1][banque/Image18.jpg]{\gdef\inserttitlepagefig{#1}\usebeamertemplate*{title page}}

\usetikzlibrary{fit}
\tikzset{
  fitting node/.style={
    inner sep=0pt,
    fill=none,
    draw=none,
    reset transform,
    fit={(\pgf@pathminx,\pgf@pathminy) (\pgf@pathmaxx,\pgf@pathmaxy)}
  },
  reset transform/.code={\pgftransformreset}
}

\setbeamertemplate{title page}
{
  \begin{tikzpicture}[overlay,remember picture,inner sep=0,outer sep=0]
		\node[anchor=north east] at (current page.north east) {\includegraphics[width=.45\textwidth]{bgs/bg2.jpg}};
  
        \draw[anchor=north west,fill,laplaceOrange] (current page.north west) rectangle ++(0.3\paperwidth,-2.) node[fitting node] (rect) {} node[midway] (laplace_center) {} node[yshift=0.4pt,xshift=-0.3pt] (point) {};
        \node[] at (laplace_center) {\includegraphics[width=.25\textwidth]{logos/laplace_full.png}};
        \draw[fill,laplaceOrange] (point) rectangle ($(current page.south east)+(0,1)$) node[fitting node] (big_orange) {};

        \begin{scope}
          \clip (point) rectangle (current page.south west);
          \ifx\inserttitlepagefig\@empty%
            \draw (point) rectangle (current page.south west)  node[midway] (title_figure) {\includegraphics[height=\paperheight]{banque/Image18.jpg}};
          \else
            \draw (point) rectangle (current page.south west)  node[midway] (title_figure) {\includegraphics[height=\paperheight]{\inserttitlepagefig}};
          \fi%%

        \end{scope}
        \draw[fill,laplaceBlack] ($(point|-current page.south east) + (0,1)$) rectangle (current page.south east) node[midway] (center_black_target) {};

        \ifx\insertconferencelogo\@empty%
        \else
          \node[anchor=south east,yshift=.25cm,xshift=-.25cm] (conference_logo) at (big_orange.south east) {\includegraphics[height=1.5cm]{\insertconferencelogo}};
        \fi%%

        \node[anchor=east] (ups_logo) at (center_black_target-|current page.south east) {\includegraphics[height=0.8cm]{logos/ups.png}}  {};
        \node[left=.5cm of ups_logo]  (n7_logo) {\includegraphics[height=0.6cm]{logos/n7.png}};
        \node[left=.5cm of n7_logo] {\includegraphics[height=0.6cm]{logos/cnrs.png}};        
        \node (title) at ($(point) + (.5,-.5)$) {} node[anchor=north west,align=left,font=\color{white}\usebeamerfont{title}] at (title) {\inserttitle};
        \node (subtitle) at ($(title)+(0,-1.5)$) {} node[anchor=north west,align=left,font=\color{white}\usebeamerfont{subtitle}] at (subtitle) {\insertsubtitle};
        \node (author) at ($(subtitle)+(0,-1.2)$) {} node[anchor=north west,align=left] at (author) {\insertauthor};
        \node (date) at ($(author)+(0,-1.75)$) {} node[anchor=north west,align=left,font=\color{white}\usebeamerfont{date}] at (date) {\insertdate};
    \end{tikzpicture}    
}  

\setbeamertemplate{section in toc}
{\leavevmode\leftskip=0ex%
  \inserttocsectionnumber. \inserttocsection\par%
}

\setbeamertemplate{subsection in toc}
{\leavevmode\leftskip=2ex%
  \@Alph\inserttocsubsectionnumber. \inserttocsubsection\par%
}

\setbeamertemplate{headline}
{
}

\setbeamerfont{frametitle}{series=\bfseries,size=\LARGE}
\setbeamerfont{framesubtitle}{series=\mdseries,size=\normalsize}
\setbeamercolor{frametitle}{fg=laplaceOrange}
\setbeamertemplate{frametitle}
{
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    \node[anchor=north west]  at ($(current page.north west)+(.5,-.5)$) {\usebeamerfont*{frametitle}\insertframetitle} node (frametitle){};
    % \usebeamerfont*{frametitle}\insertframetitle%
    \ifx\insertframesubtitle\@empty%
    \else
    \node[anchor=north west] at ($(frametitle)+(0,-.75)$) {\usebeamerfont*{framesubtitle}\insertframesubtitle};
      % \par{\usebeamerfont*{framesubtitle}{\usebeamercolor[fg]{framesubtitle}\insertframesubtitle}\strut\par}%
    \fi%%

  \end{tikzpicture}
}

\expandafter\let\csname beamer@@tmpop@background@default\endcsname\relax
\defbeamertemplate{background}{default}{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
		\node[anchor=north east] at (current page.north east) {\includegraphics[width=.45\textwidth]{bgs/bg1.jpg}};
    \end{tikzpicture}
}
% \AfterEndEnvironment{frame}{%
%   \setbeamertemplate{background}[default]%
% }


\defbeamertemplate{background}{vertical_watermark}{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
		\node[anchor=north east] at (current page.north east) {\includegraphics[height=.7\paperheight]{bgs/bg3.jpg}};
    \end{tikzpicture}
}
\defbeamertemplate{background}{alternate_watermark}{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
		\node[anchor=north east] at (current page.north east) {\includegraphics[width=.45\textwidth]{bgs/bg2.jpg}};
    \end{tikzpicture}
}
\defbeamertemplate{background}{big_image_right}[1]
{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    % \clip (current page.north east) rectangle ($(current page.south east) +(0,0)$);
    \def\size{.35\paperwidth}
    \clip (current page.north east) rectangle ($(current page.south east) +(-\size,0)$);
    \node[yshift=.5ex] at ($(current page.east) +(-0.5*\size,0)$) {\includegraphics[height=\paperheight-1.5ex]{#1}};
  \end{tikzpicture}
}

\define@key{beamerframe}{default}[true]{%
  \setbeamertemplate{background}[default]%
  \setbeamertemplate{footline}[default]%
}
\define@key{beamerframe}{vertical_watermark}[true]{%
  \setbeamertemplate{background}[vertical_watermark]%
  \setbeamertemplate{footline}[default]%
}
\define@key{beamerframe}{alternate_watermark}[true]{%
  \setbeamertemplate{background}[alternate_watermark]%
  \setbeamertemplate{footline}[default]%
}
\define@key{beamerframe}{big_image_right}[true]{%
  \setbeamertemplate{background}[big_image_right]{#1}%
  \setbeamertemplate{footline}[big_image_right]
}

\setbeamertemplate{background}[default]
% \setbeamertemplate{background}[vertical_watermark]

\def\endpage{\usebeamertemplate*{end page}}

\setbeamertemplate{end page}
{
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]

        % \draw[anchor=north west,fill,laplaceOrange] (current page.north west) rectangle ++(0.3\paperwidth,-2.) node[midway] (laplace_center) {} node (point) {};
        % \node[] at (laplace_center) {\includegraphics[width=.25\textwidth]{logos/laplace_full.png}};
        \draw[fill,laplaceOrange] (current page.north west) rectangle (current page.south east);

        \draw[fill,laplaceBlack] ($(current page.north west) + (0,-1.5)$) rectangle (current page.north east) node[midway] (center_black_target) {};
        \node[anchor=east] (ups_logo) at (center_black_target-|current page.south east) {\includegraphics[height=0.8cm]{logos/ups.png}};

        \node[anchor=south east] (laplace_logo) at ($(current page.south east) +(-0.5,0.5)$) {\includegraphics[height=0.5cm]{logos/laplace.png}} ;

        \node[anchor=south west,align=left,font=\color{laplaceWhite}\mdseries\scriptsize] at ($(current page.south west) +(0.5,0.5)$) { UNIVERSITÉ PAUL SABATIER\\Bât. 3R3, 118 route de Narbonne\\ 31062 Toulouse Cedex 9\\~\\+33 (0)5 61 55 67 97\\sec-ups@laplace.univ-tlse.fr} node (UPS_adress) {};

        \node[anchor=south west,align=left,font=\color{laplaceWhite}\mdseries\scriptsize] at ($(current page.south west) +(5.5,0.5)$) { ENSEEIHT\\2 Rue Camichel,\\31071 Toulouse Cedex 7\\~\\+33 (0)5 34 32 23 91\\ sec-n7@laplace.univ-tlse.fr} node (N7_adress) {};

        \node[left=.5cm of ups_logo]  (n7_logo) {\includegraphics[height=0.6cm]{logos/n7.png}};
        \node[left=.5cm of n7_logo] (cnrs_logo) {\includegraphics[height=0.6cm]{logos/cnrs.png}};


        \ifx\insertconferencelogo\@empty%
        \else
          \node[left=.5cm of laplace_logo] (conference_logo) {\includegraphics[height=1.3cm]{\insertconferencelogo}};
        \fi%%

        \node[anchor=west] (laplace_link) at ($(center_black_target-|current page.south west) + (0.5,0)$) {\usebeamercolor[bg]{laplaceWhite}\url{http://www.laplace.univ-tlse.fr}}  {};

    \end{tikzpicture}
}


%  % \setbeamercolor{block title}{bg=red!50!black!70}
%  \setbeamercolor{block title}{bg=laplaceBlack}
%  \setbeamercolor{block title example}{bg=gray!90!black!90}
%  \setbeamercolor{block title example}{bg=gray!90!black!90}
%
%  \setbeamercolor{block title example}{bg=supelecPurple!90}
%  \setbeamercolor{block title example}{bg=supelecPurple!90}
%  \setbeamercolor{palette quaternary}{bg=supelecPurple!90}
%
%  % \setbeamercolor{item}{fg=red!50!black!80}
%  \setbeamercolor{item}{fg=laplaceBlack}
%  \setbeamercolor{section in toc}{fg=red!50!black!80}
%  % \setbeamercolor{frametitle}{fg=laplaceBlack!90,bg=white}
%  \setbeamercolor{framesubtitle}{fg=white,bg=ietrbrightRed!90}
%  \setbeamercolor{framesubtitle}{fg=laplaceBlack,bg=ietrRed!10}
%  % \setbeamercolor{framesubtitle}{fg=laplaceBlack,bg=laplaceBlack!10}
%
%  % \setbeamercolor{section in head}{bg=laplaceBlack!20}
%
%  % \setbeamercolor{bibliography entry author}{fg=red!50!black!80}
%  \setbeamercolor{bibliography entry author}{fg=laplaceBlack}
%  % \setbeamercolor{bibliography entry location}{fg=red!50!black!40}
%  \setbeamercolor{bibliography entry location}{fg=laplaceBlack!70}
%
%  \setbeamercolor{button}{bg=laplaceBlack}
%  % \setbeamercolor{author in head/foot}{bg=grey!60}
%  % \setbeamercovered{transparent}

%  \makeatletter
%  \protected\def\protectedempty{}
\setbeamertemplate{page number in head/foot}[appendixframenumber]
%
\expandafter\let\csname beamer@@tmpop@footline@default\endcsname\relax
\defbeamertemplate{footline}{default}
{
  \leavevmode%
  \hbox{
    \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{author in head/foot}%
    \end{beamercolorbox}
  }%
  \vskip0pt%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    % \node[anchor=south east] (laplace_logo) at ($(current page.south east) +(-0.5,0.5)$) {\includegraphics[height=0.5cm]{logos/laplace_orange.png}} ;

    \node[font=\color{laplaceOrange}] (laplace_logo) at ($(0,0) +(0.5,0.5)$) {\insertframenumber/\inserttotalframenumber} ;
    \draw[fill=laplaceOrange,laplaceOrange] (current page.south west) rectangle ($(current page.south east) + (0,2.25ex)$);

    \draw[fill=laplaceBlack] ($(-1\paperwidth/\inserttotalframenumber+\paperwidth*\insertframenumber/\inserttotalframenumber,0.0)$) rectangle +(\paperwidth/\inserttotalframenumber,2.25ex);
  \end{tikzpicture}

 }

\defbeamertemplate{footline}{big_image_right}
{%
  \leavevmode%
  \hbox{
    \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{author in head/foot}%
    \end{beamercolorbox}
  }%
  \vskip0pt%
\begin{tikzpicture}[overlay,remember picture,inner sep=0]
    % \node[anchor=south east] (laplace_logo) at ($(current page.south east) +(-0.5,0.5)$) {\includegraphics[height=0.5cm]{logos/laplace_orange.png}} ;

    \node[font=\color{laplaceOrange}] (laplace_logo) at ($(0,0) +(0.5,0.5)$) {\insertframenumber/\inserttotalframenumber} ;
    \draw[fill=laplaceOrange,laplaceOrange] (current page.south west) rectangle ($(current page.south east) + (0,2.25ex)$);

    \draw[fill=laplaceBlack] ($(-1\paperwidth/\inserttotalframenumber+\paperwidth*\insertframenumber/\inserttotalframenumber,0.0)$) rectangle +(\paperwidth/\inserttotalframenumber,2.25ex);
  \end{tikzpicture}
}

 \setbeamertemplate{background}[default]
\setbeamertemplate{footline}[default]

%
%  \setbeamertemplate{note page}{
%    \vfill
%    \insertnote
%    \vfill
%  }
%
%  \setbeamersize{text margin right=1.5cm}
%  \setbeamersize{text margin left=1.5cm}
%
%  \setbeamertemplate{sidebar right}{
%    % \vskip1.3cm%
%    % \llap{\tikz{\draw[fill=black] (.75,0) circle [radius=.75cm]}\hskip0.2cm}%
%    \vfill%
%    \llap{\insertlogo\hskip0.2cm}%
%    \vskip3pt%
%  }
%  \setbeamertemplate{sidebar left}{
%    \vfill%
%    \ifwebcast{\hspace{3pt}\tikz{\draw[fill=pink,draw=pink] (.6,0) circle [radius=.6cm]}}%
%    \else%
%    % \hspace{3pt}\tikz{\draw[fill=white,draw=white] (.6,0) circle [radius=.6cm]}%
%    \fi
%    \vskip3pt%
%  }
%
%  \setbeamertemplate{headline}
%  {%
%    % \leavevmode%
%    \ifx\secname{}\@empty%
%    \else%
%    \hbox{%
%      \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1ex,center]{section in head/foot}%
%        \centering
%        \usebeamerfont{author in head/foot}\strut\insertsectionhead\strut\par%
%      \end{beamercolorbox}%
%      \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1ex,right]{subsection in head/foot}%
%        \centering
%        \insertsubsection{}
%      \end{beamercolorbox}%
%    }
%    \fi
%    \vskip0pt%
%  }
%
%  \setbeamertemplate{caption}[numbered]
%  % or whatever (possibly just delete it)
}
%\mode
%<all>


\makeatother

\newcommand{\tikzmark}[1]{\tikz[baseline={(#1.base)},overlay,remember picture] \node[outer sep=0pt, inner sep=0pt] (#1) {\phantom{A}};}
\newcommand{\tikzmarktext}[2]{\tikz[baseline={(#1.base)},remember picture] \node[inner sep=1.5pt,outer sep=0pt] (#1) {#2};}
