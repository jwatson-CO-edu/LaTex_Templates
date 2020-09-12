%
% hw_grad.cls
% James Watson
% Version: 2020-09
% variation of jstrom-short.cls from Joho Strom. inspired by resume.cls from dburrows
%

% === DOC SETUP ===============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hw_grad}
\LoadClassWithOptions{article}
\RequirePackage{calc}            % Needed for settoheight manipulations

% ___ END DOC _________________________________________________________________


% === PACKAGE IMPORT ==========================================================

% ~~ Load First ~~
\usepackage[all, cmtip]{xy} % Should be first import
\usepackage[utf8]{inputenc}

% ~~ Graphics and Figures ~~
\usepackage{float} % Force figure placement [H] , Sometimes ugly!
\usepackage{graphicx} % needed for including graphics e.g. EPS, PS
\usepackage{epstopdf} % Process EPS from matplotlib --> PDF
\usepackage{verbatim} % Block Comment: \begin{comment} ... \end{comment}
\usepackage{tkz-graph} % For drawing graphs
\usepackage{tikz} % Drawing other stuff
    \usetikzlibrary{arrows}
    \usetikzlibrary{calc}

% ~~ Code and Algorithms ~~
\usepackage{listings}
\usepackage{verbatim} % Block Comment: \begin{comment} ... \end{comment}
\usepackage{ifthen}
\usepackage{framed} % frame a lot of stuff, URL: http://tex.stackexchange.com/a/163376
\usepackage{ragged2e}

% ~~ Equation Formatting ~~
\usepackage{cancel}

% ~~ Load Last ~~
\usepackage{wasysym} % Load the package 'wasysym' after the 'ams' packages 

% ___ END IMPORT ______________________________________________________________


% === PAGE FORMAT =============================================================

\topmargin -1.5cm        % read Lamport p.163
\oddsidemargin -0.04cm   % read Lamport p.163
\evensidemargin -0.04cm  % same as oddsidemargin but for left-hand pages
\textwidth 16.59cm
\textheight 21.94cm
\parskip 7.2pt           % sets spacing between paragraphs
\renewcommand{\baselinestretch}{1.0} % 1.0 (was 1.5) spacing between lines
\parindent 0pt		  % sets leading space for paragraphs
\pagenumbering{arabic}
\RaggedRight
\usepackage[margin=0.5in]{geometry} % Reasonable margins! 

% ___ END PAGE ________________________________________________________________


% == New Commands =============================================================

% ~~ Text Formatting ~~
\newcommand{\BU}[1]{\underline{\textbf{#1}}} % \BU - bold and underline

% ~~ Text Symbols ~~
\newcommand{\rarw}{$\rightarrow$\ }
\newcommand{\larw}{$\leftarrow$\ }
\newcommand{\circchar}[1]{{\Large \textcircled{\normalsize #1}}} % Circle a character for diagrams/graphs
\newcommand{\circmath}[1]{{\LARGE \textcircled{\normalsize #1}}} % Circle large enough for a negated character

% ~ Text Shortcuts ~
\newcommand{\ans}{\textbf{Answer}:\ }

% ~~ Equation Formatting ~~
\newcommand{\ds}{\displaystyle}
\newcommand{\mbf}[1]{\mathbf{#1}}
\newcommand{\lfb}{\left[}  
\newcommand{\rtb}{\right]}
\newcommand{\lfp}{\left(}  
\newcommand{\rtp}{\right)}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}

% ~ Bold Vectors & Matrices ~
\def\vphi{\hbox{\boldmath$\phi$}}
\def\veta{\hbox{\boldmath$\eta$}}
\def\vpsi{\hbox{\boldmath$\psi$}}
\def\vtheta{\hbox{\boldmath$\theta$}}
\def\va{\hbox{\boldmath$a$}}
\def\vA{\hbox{\boldmath$A$}}
\def\vb{\hbox{\boldmath$b$}}
\def\vc{\hbox{\boldmath$c$}}
\def\vC{\hbox{\boldmath$C$}}
\def\vd{\hbox{\boldmath$d$}}
\def\vepsilon{\hbox{\boldmath$\epsilon$}}
\def\vf{\hbox{\boldmath$f$}}
\def\vg{\hbox{\boldmath$g$}}
\def\vI{\hbox{\boldmath$I$}}
\def\vJ{\hbox{\boldmath$J$}}
\def\vk{\hbox{\boldmath$k$}}
\def\vl{\hbox{\boldmath$l$}}
\def\vL{\hbox{\boldmath$L$}}
\def\vn{\hbox{\boldmath$n$}}
\def\vN{\hbox{\boldmath$N$}}
\def\vp{\hbox{\boldmath$p$}}
\def\vq{\hbox{\boldmath$q$}}
\def\vr{\hbox{\boldmath$r$}}
\def\vR{\hbox{\boldmath$R$}}
\def\vS{\hbox{\boldmath$S$}}
\def\vt{\hbox{\boldmath$t$}}
\def\vT{\hbox{\boldmath$T$}}
\def\vv{\hbox{\boldmath$v$}}
\def\vV{\hbox{\boldmath$V$}}
\def\vx{\hbox{\boldmath$x$}}
\def\vy{\hbox{\boldmath$y$}}
\def\vz{\hbox{\boldmath$z$}}
\def\vomega{\hbox{\boldmath$\omega$}}
% ~ Special Matrices ~
\def\eye{\hbox{\boldmath$I$}}
\def\ones{\hbox{\boldmath$1$}}
\def\Rot{\hbox{\boldmath$R$}}
\def\Trans{\hbox{\boldmath$T$}}
\def\vzero{\hbox{\boldmath$0$}}

% __ END CMD __________________________________________________________________


% === TITLE BLOCK =============================================================

\newcommand{\@authorname}{}
\renewcommand{\@title}{}
\newcommand{\@class}{}
\newcommand{\@duedate}{}
\newcommand{\@institute}{}

\renewcommand{\author}[1]{\renewcommand{\@authorname}{#1}}
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\newcommand{\class}[1]{\renewcommand{\@class}{#1}}
\newcommand{\duedate}[1]{\renewcommand{\@duedate}{#1}}
\newcommand{\institute}[1]{\renewcommand{\@institute}{#1}}


%%%%% Define a table to hold the author, etc to be placed in title
\newcommand{\authortable}{
    \begin{tabular}{@{} r @{}}
        \@authorname \\
        \@duedate\\
    \end{tabular}
}

%%%%% Over ride the \maketitle command %%%%%
\renewcommand{\maketitle}{
    \par
    %%%%% Discover the size of the author box so we can
    %%%%% give the correct amount of space to the title
    \newlength{\authorwidth}
    \settowidth{\authorwidth}{\authortable}
    %%%%% Place the title and the author box side-by-side
    \noindent
    \parbox{
    (\textwidth)}{\bf{\Large \@title} \\
        \@class \hfill  \@authorname\\
        \@institute \hfill \@duedate
    }  \newline
    % \mbox{ \authortable }
    %%%%% Find height of the current font
    \newlength{\fontheight}
    \settoheight{\fontheight}{A}
    %%%%% Draw a horizontal line
    \noindent \rule[\fontheight]{\textwidth}{.5pt}
}

% __ END TITLE __________________________________________________________________

