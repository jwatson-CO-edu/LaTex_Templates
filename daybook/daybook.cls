%%%%%
% daybook.cls
% James Watson , 2017 June
% Class for notes and journal
% VERSION: 2017-06-16
%%%%%

% ==== Init ================================================================================================================================

% == Setup ==
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{daybook}%[2017-06-04 , Class for notes and journal]
% \LoadClass[twoside]{report}
\RequirePackage{palatino}
\LoadClass[letterpaper,twoside,onecolumn,final,openany,12pt]{extreport}
% \LoadClassWithOptions[12pt]{report}
% == End Setup ==

% == Imports ==
\usepackage{parskip} % Adds spacing between paragraphs
\usepackage{relsize} % Define font sizes as multiples or fractions of the normal document font
%                      Used by \LQ
%\usepackage{mathabx} % FIXME: WAITING ON DL
\usepackage{ulem}
% == End Imports ==

% ==== End Init ============================================================================================================================

% == Page Formatting ==
\usepackage[ inner=0.75in , outer=0.25in , top=0.25in , bottom=0.75in  ]{geometry}
\setlength{\parindent}{15pt} % Indent paragraphs\\
% Set the spacing between paragraphs and enumerate/itemize items % http://tex.stackexchange.com/a/136050/115244
\setlength{\itemsep}{1pt}
\setlength{\parskip}{1pt}
\setlength{\parsep}{1pt}
\pagestyle{plain}
% == End Page ==

% == New Commands ==

% = Font Commands =
\newcommand{\BU}[1]{\underline{\textbf{#1}}} % \BU - bold and underline
% = End Font =

% = Symbol Commands =
\usepackage{mathabx} % Needed symbols
\newcommand{\dmd}{$\blackdiamond$\ }
\newcommand{\rarw}{$\rightarrow$\ }
\newcommand{\larw}{$\leftarrow$\ }
% = End Symbol =

% = Quotation Commands =
\newcommand{\scaledQuote}[4]{
{\normalfont\normalsize{ % Create a mini-environment for the command with {...}
		%``\textbf{\relscale{1.5} #1}'' - \textit{ \relscale{1.25} #2 } % Define relative text sizes
		``\textbf{\relscale{#1} #3}'' - \textit{\relscale{#2} #4} % Define relative text sizes
	} } % close the mini-environment
}

\newcommand{\LQ}[2]{ % \LQ - Large Quote
	\scaledQuote{1.4}{1.2}{#1}{#2}
}

\newcommand{\MQ}[2]{ % \MQ - Medium Quote
	\scaledQuote{1.2}{1.1}{#1}{#2}
}

\newcommand{\SQ}[2]{ % \SQ - Small Quote
	\scaledQuote{1}{1}{#1}{#2}
}
% = End Quotation =

% == End Commands ==




