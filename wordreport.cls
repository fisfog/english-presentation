\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wordreport}[2014/01/01 A domain-specific, Word-like report template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions*
\LoadClass{report}

\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage[abspath]{currfile}
\RequirePackage{lastpage}
\RequirePackage{everypage}
\RequirePackage{marvosym}

\def\address#1#2#3{%
  \gdef\@addressA{#1}%
  \gdef\@addressB{#2}%
  \gdef\@addressC{#3}}
\def\phone#1{%
  \gdef\@phone{#1}}
\def\fax#1{%
  \gdef\@fax{#1}}
\def\webaddress#1{%
  \gdef\@webaddress{#1}}

\def\preparedfor#1{%
  \gdef\@prepared@for{#1}}
\def\poreference#1{%
  \gdef\@po@reference{#1}}
\def\projectnumber#1{%
  \gdef\@project@number{#1}}
\def\testreportnumber#1{%
  \gdef\@test@report@number{#1}}
\def\logoimage#1{%
  \gdef\@logoimage{#1}}

\def\phonesymbol#1{%
  \gdef\@symbol@phone{#1}}
\def\faxsymbol#1{%
  \gdef\@symbol@fax{#1}}
\def\webaddresssymbol#1{%
  \gdef\@symbol@webaddress{#1}}

\def\@symbol@phone{\Telefon}
\def\@symbol@fax{\Faxmachine}
\def\@symbol@webaddress{\Lightning}

\tikzset{
  report blue/.style={
    color=blue!50!white,
  },
  report gray/.style={
    color=gray,
  },
  report frame/.style={
    thick,
    report blue,
  },
}

\AddEverypageHook{\begin{tikzpicture}[remember picture, overlay]
    \coordinate (top left)     at ($ (current page.north west) + (1cm,  -1cm) $);
    \coordinate (top right)    at ($ (current page.north east) + (-1cm, -1cm) $);
    \coordinate (bottom left)  at ($ (current page.south west) + (1cm,  1cm) $);
    \coordinate (bottom right) at ($ (current page.south east) + (-1cm, 1cm) $);
    \coordinate (frame top left)     at ($ (top left)  - (0, 2.5cm) $);
    \coordinate (frame top right)    at ($ (top right) - (0, 2.5cm) $);
    \coordinate (frame bottom left)  at ($ (bottom left)  + (0, .5cm)$);
    \coordinate (frame bottom right) at ($ (bottom right) + (0, .5cm)$);
    \coordinate (frame title mid left)  at ($ (frame top left)  + (1cm,  0) $);
    \coordinate (frame title mid right) at ($ (frame top right) + (-1cm, 0) $);
    \coordinate (frame title top left)  at ($ (frame title mid left) + (0, 3mm) $);
    \coordinate (frame title top right) at ($ (frame title mid right) + (0, 3mm) $);
    \coordinate (frame title bottom left)  at ($ (frame title mid left) - (0, 10mm) $);
    \coordinate (frame title bottom right) at ($ (frame title mid right) - (0, 10mm) $);
    \node [opacity=0.5] at (top left)  [below right]
      {\includegraphics[width=2cm]{\@logoimage}};
    \node [report blue] at ($ (top left) + (0cm, -1.9cm) $) [right]
      {\sffamily TEST REPORT};
    \node [report blue] at ($ (top right) + (3mm, -2mm) $) [below left]
      {\sffamily\footnotesize
        \begin{tabular}{lcl}
          Address Information. &                               \\[.5ex]
          \@addressA           & \@symbol@phone      & \@phone \\
          \@addressB           & \@symbol@fax        & \@fax   \\
          \@addressC           & \@symbol@webaddress & \@webaddress
        \end{tabular}};
    \node [opacity=0.5, report blue] at ($ (frame bottom left) - (3mm, 0) $) [below right]
      {\begin{tabular}{l}
          \sffamily
          \footnotesize
          COMPANY CONFIDENTIAL \\[-1ex]
          \scriptsize\ttfamily
          \currfileabspath
        \end{tabular}};
    \node [opacity=0.5, report blue] at ($ (frame bottom right) + (2mm - 2pt, 0) $) [below left]
      {\sffamily\footnotesize
        Page \thepage\ of \pageref{LastPage}};
    \node [report gray] at ($ (frame top right)!.5!(frame top left) $) [below]
      {\sffamily\@title};
    \node [report gray] at ($ (frame title bottom left) - (3mm, 0) $) [below right]
      {\sffamily\footnotesize
        \begin{tabular}{rl}
          Prepared for: & \@prepared@for \\
          PO Reference: & \@po@reference
        \end{tabular}};
    \node [report gray] at ($ (frame title bottom right) + (3mm, 0) $) [below left]
      {\sffamily\footnotesize
        \begin{tabular}{rr}
          Project Number: & \@project@number \\
          Test Report Number: & \@test@report@number
        \end{tabular}};
    \draw[report frame]
      (frame bottom left) --
      (frame bottom right);
    \draw[report frame]
      ($ (frame bottom left) + (0cm, 1mm) $) --
      (frame top left) --
      (frame title mid left);
    \draw[report frame]
      ($ (frame bottom right) + (0cm, 1mm) $) --
      (frame top right) --
      (frame title mid right);
    \draw[report frame]
      (frame title top left) rectangle (frame title bottom right);
  \end{tikzpicture}}

\pagestyle{empty}

\RequirePackage[top=5.5cm,
               left=2cm,
              right=2cm,
             bottom=2cm]{geometry}

% Local Variables:
% truncate-lines: t
% TeX-master: "word.tex"
% TeX-PDF-mode: t
% End:
