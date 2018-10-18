%% ============================================================================
%%
%%  UDCthesis.cls
%%
%%  LaTeX class for PhD. and MSc. thesis with UDC style
%%
%%  Copyright 2018 Jacobo Diaz Garcia - jdiaz@udc.es
%%
%%  LICENSE:
%%  This work may be distributed and/or modified under the conditions of the
%%  LaTeX Project Public License version 1.3 or any later version.
%%
%%  CHANGELOG:
%%  jan 2018 v2.0:
%%  - Major refactoring
%%
%%  sep 2014 v1.5:
%%  - Added Latin Modern as default font with PdfLaTeX
%%  - Added more professional fonts via UDCfonts
%%  - Removed ifxetex and ifpdf packages
%%
%%  jul 2014 v1.4:
%%  - Minor corrections
%%
%%  jun 2014 v1.3:
%%  - Added draft commands
%% ============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UDCthesis}[2018/01/16 v2.0 LaTeX thesis class with UDC style]

% -----------------------------------------------------------------------------
% Class options
% -----------------------------------------------------------------------------

\RequirePackage{pgfopts}
\RequirePackage{etoolbox}

% -----------------------------------------------------------------------------
% Class options
% -----------------------------------------------------------------------------
\newif\ifusertheme@debug
\newif\ifusertheme@draft
\newif\ifusertheme@showlayout
\newif\ifusertheme@titlepage
\newif\ifusertheme@eqnumbers
\newif\ifusertheme@twocolumn
\newif\ifusertheme@minimal
\newif\ifusertheme@toc
\newif\ifusertheme@lof
\newif\ifusertheme@lot
\newif\ifusertheme@tikz
\newif\ifusertheme@tcolorbox
\newif\ifusertheme@menukeys
\newif\ifusertheme@biblatex
\newif\ifusertheme@biblatexglobalbib
\newif\ifusertheme@biblatexchapterbib

\newcounter{idusertheme@titlelogo}

\pgfkeys{
/classoptions/.cd,
font/.is choice,
font/cmr/.code = \def\usertheme@font{cmr},
font/times/.code = \def\usertheme@font{times},
font/utopia/.code = \def\usertheme@font{utopia},
font/pagella/.code = \def\usertheme@font{pagella},
font/stix/.code = \def\usertheme@font{stix},
font/minion/.code = \def\usertheme@font{minion},
font/garamond/.code = \def\usertheme@font{garamond},
font/arno/.code = \def\usertheme@font{arno},
font/warnock/.code = \def\usertheme@font{warnock},
font/helvetica/.code = \def\usertheme@font{helvetica},
font/frutiger/.code = \def\usertheme@font{frutiger},
font/futura/.code = \def\usertheme@font{futura},
font/optima/.code = \def\usertheme@font{optima},
font/myriad/.code = \def\usertheme@font{myriad},
font/univers/.code = \def\usertheme@font{univers},
fontmath/.is choice,
fontmath/default/.code = \def\usertheme@fontmath{default},
fontmath/cmr/.code = \def\usertheme@fontmath{cmr},
fontmath/stix/.code = \def\usertheme@fontmath{stix},
fontmath/pagella/.code = \def\usertheme@fontmath{pagella},
fontmath/asana/.code = \def\usertheme@fontmath{asana},
fontmono/.is choice,
fontmono/cmr/.code = \def\usertheme@fontmono{cmr},
fontmono/inconsolata/.code = \def\usertheme@fontmono{inconsolata},
fontmono/inconsolatan/.code = \def\usertheme@fontmono{inconsolatan},
typesize/.is choice,
typesize/9/.code = \def\usertheme@typesize{9pt},
typesize/10/.code = \def\usertheme@typesize{10pt},
typesize/11/.code = \def\usertheme@typesize{11pt},
typesize/12/.code = \def\usertheme@typesize{12pt},
typesize/14/.code = \def\usertheme@typesize{14pt},
fontsize/.is choice,
fontsize/normalsize/.code={\def\usertheme@fontsize{\normalsize}},
fontsize/small/.code={\def\usertheme@fontsize{\small}},
fontsize/footnotesize/.code={\def\usertheme@fontsize{\footnotesize}},
fontsize/scriptsize/.code={\def\usertheme@fontsize{\scriptsize}},
fontsize/large/.code={\def\usertheme@fontsize{\large}},
fontsize/Large/.code={\def\usertheme@fontsize{\Large}},
language/.is choice,
language/en/.code = \def\usertheme@language{english},
language/es/.code = \def\usertheme@language{spanish},
debug/.is if=usertheme@debug,
draft/.is if=usertheme@draft,
showlayout/.is if=usertheme@showlayout,
titlepage/.is if=usertheme@titlepage,
titlelogo/.is choice,
titlelogo/none/.code={\setcounter{idusertheme@titlelogo}{0}},
titlelogo/udc/.code={\setcounter{idusertheme@titlelogo}{1}},
titlelogo/udciccp/.code={\setcounter{idusertheme@titlelogo}{2}},
titlelogo/udcmiema/.code={\setcounter{idusertheme@titlelogo}{3}},
eqnumbers/.is if=usertheme@eqnumbers,
twocolumn/.is if=usertheme@twocolumn,
minimal/.is if=usertheme@minimal,
toc/.is if=usertheme@toc,
lof/.is if=usertheme@lof,
lot/.is if=usertheme@lot,
tikz/.is if=usertheme@tikz,
tcolorbox/.is if=usertheme@tcolorbox,
menukeys/.is if=usertheme@menukeys,
biblatex/.is if=usertheme@biblatex,
biblatex-style/.is choice,
biblatex-style/numeric/.code = \def\usertheme@biblatexstyle{numeric-comp},
biblatex-style/alphabetic/.code = \def\usertheme@biblatexstyle{alphabetic},
biblatex-style/authoryear/.code = \def\usertheme@biblatexstyle{authoryear-icomp},
biblatex-sorting/.is choice,
biblatex-sorting/nyt/.code = \def\usertheme@biblatexsorting{nyt},
biblatex-sorting/ynt/.code = \def\usertheme@biblatexsorting{ynt},
biblatex-sorting/ydnt/.code = \def\usertheme@biblatexsorting{ydnt},
biblatex-sorting/none/.code = \def\usertheme@biblatexsorting{none},
biblatex-globalbib/.is if=usertheme@biblatexglobalbib,
biblatex-chapterbib/.is if=usertheme@biblatexchapterbib,
}

% Default values
\pgfkeys{
/classoptions/.cd,
font = cmr,
fontmath = default,
fontmono = cmr,
typesize = 10,
fontsize = normalsize,
language = es,
debug = false,
draft = false,
showlayout = false,
titlepage = true,
titlelogo = udc,
eqnumbers = true,
twocolumn = false,
minimal = false,
toc = false,
lof = false,
lot = false,
tikz = false,
tcolorbox = false,
menukeys = false,
biblatex = false,
biblatex-style = numeric,
biblatex-sorting = none,
biblatex-globalbib = true,
biblatex-chapterbib = false,
}

% New options specific to this class and not defined in UDCoptions.sty --------
\newif\ifusertheme@printmode
\newif\ifusertheme@onehalfspacing
\newif\ifusertheme@printby
\newif\ifusertheme@preface
\newif\ifusertheme@dedication
\newif\ifusertheme@acknowledgements
\newif\ifusertheme@abstracten
\newif\ifusertheme@abstractes
\newif\ifusertheme@abstractga
\newif\ifusertheme@epigraphs
\newif\ifusertheme@notation
\newif\ifusertheme@frontmatterintoc

\newcounter{idusertheme@documentsize}

\pgfkeys{
/classoptions/.cd,
documentsize/.is choice,
documentsize/a4/.code = {\setcounter{idusertheme@documentsize}{0}},
documentsize/octavo/.code = {\setcounter{idusertheme@documentsize}{1}},
printmode/.is if=usertheme@printmode,
onehalfspacing/.is if=usertheme@onehalfspacing,
printby/.is if=usertheme@printby,
preface/.is if=usertheme@preface,
dedication/.is if=usertheme@dedication,
acknowledgements/.is if=usertheme@acknowledgements,
abstract-en/.is if=usertheme@abstracten,
abstract-es/.is if=usertheme@abstractes,
abstract-ga/.is if=usertheme@abstractga,
epigraphs/.is if=usertheme@epigraphs,
notation/.is if=usertheme@notation,
frontmatterintoc/.is if=usertheme@frontmatterintoc,
degree/.is choice,
degree/phd/.code = \def\usertheme@degree{\phdname},
degree/msc/.code = \def\usertheme@degree{\mscname},
degree/pt/.code = \def\usertheme@degree{\ptname},
}

\pgfkeys{
/classoptions/.cd,
documentsize = a4,
printmode = false,
onehalfspacing = false,
printby = true,
preface = true,
dedication = true,
acknowledgements = true,
abstract-en = true,
abstract-es = true,
abstract-ga = true,
epigraphs = true,
notation = true,
frontmatterintoc = true,
degree = phd,
}

% Default values for this class different to those set in UDCoptions.sty ------
\pgfkeys{
/classoptions/.cd,
language = en,
toc = true,
lof = true,
lot = true,
biblatex = true,
tikz = true,
}

% Process options -------------------------------------------------------------
\ProcessPgfOptions{/classoptions}

\ifusertheme@minimal%
  \pgfkeys{
  /classoptions/.cd,
  titlepage = false,
  preface = false,
  dedication = false,
  acknowledgements = false,
  abstract-en = false,
  abstract-es = false,
  abstract-ga = false,
  toc = false,
  lof = false,
  lot = false,
  notation = false,
  }
\fi

\ifusertheme@draft
  \def\usertheme@draft{draft}
\else
  \def\usertheme@draft{}
\fi

\PassOptionsToClass{\usertheme@draft, \usertheme@typesize, twoside, onecolumn, openright}{memoir}

\ifusertheme@printmode
  \ifcase\value{idusertheme@documentsize}\relax
  \or%
    \PassOptionsToClass{showtrims}{memoir}
  \fi
\fi

\ifdefstring{\usertheme@degree}{\phdname}{
  \ifcase\value{idusertheme@titlelogo}\relax%
    \pgfkeys{/classoptions/.cd,titlelogo = udc}
    \PackageWarningNoLine{UDCthesis}{Only UDC titlelogo is allowed in PhD thesis}
  \or%
  \or%
    \pgfkeys{/classoptions/.cd,titlelogo = udc}
    \PackageWarningNoLine{UDCthesis}{Only UDC titlelogo is allowed in PhD thesis}
  \or%
    \pgfkeys{/classoptions/.cd,titlelogo = udc}
    \PackageWarningNoLine{UDCthesis}{Only UDC titlelogo is allowed in PhD thesis}
  \fi
}{}

\LoadClass{memoir}

% -----------------------------------------------------------------------------
% Class style
% -----------------------------------------------------------------------------

% Notation and glossaries  ----------------------------------------------------
\RequirePackage[translate=babel,style=alttree,nowarn, nolong,nosuper,nonumberlist,section=section,nogroupskip]{glossaries}
\newglossary[glgg]{gl}{glsg}{glog}{\notationgreekletters}
\newglossary[glgr]{rl}{glsr}{glor}{\notationromanletters}
\newglossary[glga]{ac}{glsa}{gloa}{\notationacronyms}
\newcommand*\newacronymentry[4][]{\newacronym[type=ac,#1]{#2}{#3}{#4}}
\makeglossaries%
\glssetwidest{XXXXXX}
\AtEndDocument{
  \ifusertheme@notation
    % Print all terms in the glossaries
    \glsaddall%
  \fi
}

% Bibliography ----------------------------------------------------------------
\ifusertheme@biblatexchapterbib % This must be done before loading biblatex
  \ifusertheme@biblatexglobalbib
    \AtEndDocument{\printbibliography}
  \else
    \AtEndDocument{\printbibliography[segment=\therefsegment,heading=subbibliography]}
  \fi
\else
  \ifusertheme@biblatexglobalbib
    \AtEndDocument{\printbibliography}
  \fi
\fi

% Packages --------------------------------------------------------------------

\RequirePackage{regexpatch}
\RequirePackage{etoolbox}
\RequirePackage{letltxmacro}
\RequirePackage{xparse}
\RequirePackage{morewrites}
\RequirePackage{iftex}
\RequirePackage{geometry}
\RequirePackage{truncate}

\ifusertheme@debug
\else
  \RequirePackage{silence}
  \WarningFilter*{currfile}{File stack underflow}
  \WarningFilter{latex}{Empty bibliography}
  \WarningFilter{biblatex}{Patching footnotes failed}
  \WarningFilter{latex}{Unused global option(s)}
  \WarningFilter{iflang}{Mismatch between}
\fi

\RequirePackage{import}

% Tables ----------------------------------------------------------------------
\RequirePackage{booktabs}
\RequirePackage{threeparttable}
\RequirePackage{multirow}
\RequirePackage{tabularx}

% Math ------------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}  % Extension package to amsmath
\RequirePackage{array}      % New implementation of tabular and array
\RequirePackage{empheq}     % To emphasize equations
\RequirePackage{siunitx}
\AtBeginDocument{\renewcommand{\pi}{\mathchar"119}} % To avoid wrong representation of pi in siunitx https://tex.stackexchange.com/questions/33140/mathpazo-siunitx-π-turns-into-ß

\@ifclassloaded{beamer}{
  \sisetup{detect-mode=true, detect-family=false, detect-display-math=false, detect-shape=false}
  \AtBeginDocument{\sisetup{math-rm=\mathrm, text-rm=\sffamily}}
}{}

\AtEndPreamble{
  \ifusertheme@eqnumbers%
  \else%
    \mathtoolsset{showonlyrefs}
    \ifPDFTeX%
      \renewenvironment{dmath}{\begin{dmath*}}{\end{dmath*}}
    \fi
  \fi
}

% Redefine \dfrac to include a \strut and fix the vertical space
% http://tex.stackexchange.com/questions/19457/using-display-style-fraction-in-a-matrix-environment
\LetLtxMacro{\olddfrac}{\dfrac}
\renewcommand{\dfrac}[2]{\olddfrac{\strut #1}{\strut #2}}

% Fonts -----------------------------------------------------------------------
\@ifpackageloaded{UDCfonts}
  {}
  {

\RequirePackage{hyphenat}

\ifXeTeX%
  % fontspec info:
  % - Fonts can be selected either by 'font name' or by 'file name'. Fonts in standard font locations can be loaded by both ways.
  % - OpenType fonts in TexLive distribution (/usr/local/texlive/20XX/texmf-dist/fonts/opentype) can be only loaded by file name.
  % - When selecting fonts by file name, any font that can be found in the default search paths may be used directly
  %   (including in the current directory) without having to explicitly define the location of the font file on disk.
  % - Fonts selected by filename must include bold and italic variants explicitly.
  % - To load a font that is not in one of the default search paths, its location in the filesystem must be specified with the Path feature:
  %   \setmainfont{texgyrepagella}[ Path = /Users/will/Fonts/, UprightFont = *-regular, BoldFont = *-bold ]

  % Font for normal text
  \RequirePackage{fontspec}

  % Font for math text
  \RequirePackage[math-style=ISO, bold-style=ISO]{unicode-math}

  % Make \varphi and \varepsilon to produce the same result as \phi and \epsilon
  % \AtBeginDocument{%
  %   \let\phi\varphi%
  %   \let\epsilon\varepsilon%
  % }

  \newcommand{\bm}{\symbf}

  \@ifpackageloaded{hyperref}
    {\hypersetup{final}}
    {\RequirePackage[draft=false, xetex, hidelinks, bookmarksnumbered]{hyperref}}
  \RequirePackage{bookmark}

  \AtEndPreamble{

    % Main and math font ======================================================

    % Computer Modern font  ---------------------------------------------------
    \ifdefstring{\usertheme@font}{cmr}{
      % Latin Modern is the default font in fontspec, so nothing to do

      \ifdefstring{\usertheme@fontmath}{default}{
        \setmathfont{latinmodern-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{cmr}{
        \setmathfont{latinmodern-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{stix}{
        \setmathfont{xits-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{pagella}{
        \setmathfont{texgyrepagella-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{asana}{
        \setmathfont{Asana-Math.otf}
      }{}
    }{}

    % Times font --------------------------------------------------------------
    \ifdefstring{\usertheme@font}{times}{
      \IfFontExistsTF{Times New Roman}{
        \setmainfont{Times New Roman}

        \ifdefstring{\usertheme@fontmath}{default}{
          \setmathfont{xits-math.otf}
        }{}
        \ifdefstring{\usertheme@fontmath}{cmr}{
          \setmathfont{latinmodern-math.otf}
        }{}
        \ifdefstring{\usertheme@fontmath}{stix}{
          \setmathfont{xits-math.otf}
        }{}
        \ifdefstring{\usertheme@fontmath}{pagella}{
          \setmathfont{texgyrepagella-math.otf}
        }{}
      }{
        \PackageWarningNoLine{UDCfonts}{Times New Roman not available in this system. Latin Modern used instead}
      }
    }{}

    % Utopia font -------------------------------------------------------------
    \ifdefstring{\usertheme@font}{utopia}{
      \PackageWarningNoLine{UDCfonts}{utopia font option is for pdfLaTeX. Latin Modern selected instead}
    }{}

    % TeX Gyre Pagella font ---------------------------------------------------
    \ifdefstring{\usertheme@font}{pagella}{
      \setmainfont[
        Extension=.otf,
        UprightFont= *-regular,
        BoldFont=*-bold,
        ItalicFont=*-italic,
        BoldItalicFont=*-bolditalic,
        ]{texgyrepagella}

      \ifdefstring{\usertheme@fontmath}{default}{
        \setmathfont{texgyrepagella-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{cmr}{
        \setmathfont{latinmodern-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{stix}{
        \setmathfont{xits-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{pagella}{
        \setmathfont{texgyrepagella-math.otf}
      }{}
    }{}

    % Stix font ---------------------------------------------------------------
    \ifdefstring{\usertheme@font}{stix}{
      \setmainfont[
        Extension=.otf,
        UprightFont= *-regular,
        BoldFont=*-bold,
        ItalicFont=*-italic,
        BoldItalicFont=*-bolditalic,
        ]{xits}

      \ifdefstring{\usertheme@fontmath}{default}{
        \setmathfont{xits-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{cmr}{
        \setmathfont{latinmodern-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{stix}{
        \setmathfont{xits-math.otf}
      }{}
      \ifdefstring{\usertheme@fontmath}{pagella}{
        \setmathfont{texgyrepagella-math.otf}
      }{}
    }{}

    % Helvetica Neue LT Pro font ----------------------------------------------
    % ARREGALR A PARTIR DE AQUI XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    % http://empslocal.ex.ac.uk/people/staff/gv219/aofd/fonts/
    % https://tex.stackexchange.com/questions/145522/what-is-the-best-math-font-for-use-with-minion-pro-font
    % https://tex.stackexchange.com/questions/17364/applying-math-formatting-to-a-non-math-font
    % http://www.tug.dk/FontCatalogue/asanamath/
    % http://www.tug.dk/FontCatalogue/baskervillef/
    % http://www.tug.dk/FontCatalogue/charterbt/
    % http://www.tug.dk/FontCatalogue/ebgaramond/
    % http://www.tug.dk/FontCatalogue/garamondexpertmathdesign/
    % http://www.tug.dk/FontCatalogue/linuxlibertine/
    % http://www.tug.org/pracjourn/2006-1/hartke/hartke.pdf

    \ifdefstring{\usertheme@font}{helvetica}{
      \IfFontExistsTF{Helvetica Neue LT Pro}{
        \setmainfont{Helvetica Neue LT Pro}[UprightFont = * 47 Light Condensed,
                                            BoldFont = * 77 Bold Condensed,
                                            ItalicFont = * 47 Light Condensed Oblique,
                                            BoldItalicFont = * 77 Bold Condensed Oblique]

        \setsansfont{Helvetica Neue LT Pro}[UprightFont = * 47 Light Condensed,
                                            BoldFont = * 77 Bold Condensed,
                                            ItalicFont = * 47 Light Condensed Oblique,
                                            BoldItalicFont = * 77 Bold Condensed Oblique]

         % \setmathrm{Helvetica Neue LT Pro 47 Light Condensed}

         % \setmathrm{Helvetica Neue LT Pro}[UprightFont = * 47 Light Condensed,
         %                                     BoldFont = * 77 Bold Condensed,
         %                                     ItalicFont = * 47 Light Condensed Oblique,
         %                                     BoldItalicFont = * 77 Bold Condensed Oblique]

         % \setmathsf{Helvetica Neue LT Pro}[UprightFont = * 47 Light Condensed,
         %                                     BoldFont = * 77 Bold Condensed,
         %                                     ItalicFont = * 47 Light Condensed Oblique,
         %                                     BoldItalicFont = * 77 Bold Condensed Oblique]

        \setmathfont{latinmodern-math.otf}[math-style=upright]
        % \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[math-style=upright]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[range=up/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[range=it/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[range=tt/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[range=bb/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[range=bfsfup/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed}[range=sfup/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 77 Bold Condensed}[range=bfup/{latin,Latin,num}]
        \setmathfont{Helvetica Neue LT Pro 47 Light Condensed Oblique}[range=it/{latin,Latin,num}]
      }{
        \PackageWarningNoLine{UDCfonts}{Helvetica Neue LT Pro not available in this system. Latin Modern used instead}
      }

    }{}

    \ifdefstring{\usertheme@font}{minion}{
      % \defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
      % \setmainfont[Numbers={Lining,Proportional},SmallCapsFeatures={LetterSpace=6},BoldFont={Minion Pro Bold},BoldFeatures={LetterSpace=3}]{Minion Pro}
      % \setsansfont[Numbers={Lining,Proportional},LetterSpace=3]{Myriad Pro}
    }{}

    \ifdefstring{\usertheme@font}{garamond}{
      \IfFontExistsTF{Garamond Premier Pro}{
        \defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
        \setmainfont[Numbers={Lining,Proportional},SmallCapsFeatures={LetterSpace=6},BoldFont={Garamond Premier Pro Bold},BoldFeatures={LetterSpace=3}]{Garamond Premier Pro}
        \setsansfont[Numbers={Lining,Proportional},LetterSpace=3]{Myriad Pro}
        \setmathfont[math-style=upright]{latinmodern-math.otf}
        \setmathfont[range=up/{latin,Latin,num}]{Garamond Premier Pro}
        \setmathfont[range=bfup/{latin,Latin,num}]{Garamond Premier Pro Bold}
        \setmathfont[range=it/{latin,Latin,num}]{Garamond Premier Pro Italic}
      }{
        \PackageWarningNoLine{UDCfonts}{Garamond Premier Pro not available in this system. Latin Modern used instead}
      }
    }{}

    \ifdefstring{\usertheme@font}{arno}{
      \defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
      \setmainfont[Numbers={Lining,Proportional},SmallCapsFeatures={LetterSpace=6},BoldFont={Arno Pro Bold},BoldFeatures={LetterSpace=3}]{Arno Pro}
      \setsansfont[Numbers={Lining,Proportional},LetterSpace=3]{Myriad Pro}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Arno Pro}
      \setmathfont[range=bfup/{latin,Latin,num}]{Arno Pro Bold}
      \setmathfont[range=it/{latin,Latin,num}]{Arno Pro Italic}
    }{}

    \ifdefstring{\usertheme@font}{warnock}{
      \defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
      \setmainfont[Numbers={Lining,Proportional},SmallCapsFeatures={LetterSpace=6},BoldFont={Warnock Pro Bold},BoldFeatures={LetterSpace=3}]{Warnock Pro}
      \setsansfont[Numbers={Lining,Proportional},LetterSpace=3]{Myriad Pro}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Warnock Pro}
      \setmathfont[range=bfup/{latin,Latin,num}]{Warnock Pro Bold}
      \setmathfont[range=it/{latin,Latin,num}]{Warnock Pro Italic}
    }{}

    \ifdefstring{\usertheme@font}{frutiger}{
      \setmainfont[BoldFont=Frutiger LT Std 67 Bold Condensed]{Frutiger LT Std 47 Light Condensed}
      \setsansfont[BoldFont=Frutiger LT Std 67 Bold Condensed]{Frutiger LT Std 47 Light Condensed}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Frutiger LT Std 47 Light Condensed}
      \setmathfont[range=bfup/{latin,Latin,num}]{Frutiger LT Std 67 Bold Condensed}
      \setmathfont[range=it/{latin,Latin,num}]{Frutiger LT Std 47 Light Condensed}
    }{}

    \ifdefstring{\usertheme@font}{futura}{
      \setmainfont[BoldFont=Futura Std Bold Condensed]{Futura Std Light Condensed}
      \setsansfont[BoldFont=Futura Std Bold Condensed]{Futura Std Light Condensed}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Futura Std Light Condensed}
      \setmathfont[range=bfup/{latin,Latin,num}]{Futura Std Bold Condensed}
      \setmathfont[range=it/{latin,Latin,num}]{Futura Std Light Condensed Oblique}
    }{}

    \ifdefstring{\usertheme@font}{optima}{
      \setmainfont{Optima LT Std}
      \setsansfont{Optima LT Std}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Optima LT Std}
      \setmathfont[range=bfup/{latin,Latin,num}]{Optima LT Std Bold}
      \setmathfont[range=it/{latin,Latin,num}]{Optima LT Std Italic}
    }{}

    \ifdefstring{\usertheme@font}{myriad}{
      \setmainfont[BoldFont=Myriad Pro Bold Condensed]{Myriad Pro Light Condensed}
      \setsansfont[BoldFont=Myriad Pro Bold Condensed]{Myriad Pro Light Condensed}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Myriad Pro Light Condensed}
      \setmathfont[range=bfup/{latin,Latin,num}]{Myriad Pro Bold Condensed}
      \setmathfont[range=it/{latin,Latin,num}]{Myriad Pro Light Condensed Italic}
    }{}

    \ifdefstring{\usertheme@font}{univers}{
      \setmainfont[BoldFont=Univers LT Std 57 Condensed]{Univers LT Std 47 Light Condensed}
      \setsansfont[BoldFont=Univers LT Std 57 Condensed]{Univers LT Std 47 Light Condensed}
      \setmathfont[math-style=upright]{latinmodern-math.otf}
      \setmathfont[range=up/{latin,Latin,num}]{Univers LT Std 47 Light Condensed}
      \setmathfont[range=bfup/{latin,Latin,num}]{Univers LT Std 57 Condensed}
      \setmathfont[range=it/{latin,Latin,num}]{Univers LT Std 47 Light Condensed Oblique}
    }{}

    % Monospace font ==========================================================

    % Computer Modern font  ---------------------------------------------------
    \ifdefstring{\usertheme@fontmono}{cmr}{
      % Latin Modern is the default font in fontspec, so nothing to do
    }{}

    % Inconsolata font  -------------------------------------------------------
    \ifdefstring{\usertheme@fontmono}{inconsolata}{
      \setmonofont{Inconsolatazi4.otf}[UprightFont = *-Regular, BoldFont = *-Bold, ItalicFont = *-Regular, StylisticSet={2,3}]
    }{}

    % Inconsolata narrow font  ------------------------------------------------
    \ifdefstring{\usertheme@fontmono}{inconsolatan}{
      \setmonofont{InconsolataN.otf}[UprightFont = *-Regular, BoldFont = *-Bold, ItalicFont = *-Regular, StylisticSet={2,3}]
    }{}

  }

\fi

\ifPDFTeX%

  \@ifpackageloaded{hyperref}
    {\hypersetup{final}}
    {\RequirePackage[draft=false,pdftex,hidelinks,bookmarksnumbered]{hyperref}}
  \RequirePackage{bookmark}

  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}

  % Main and math font ========================================================

  % Computer Modern font  -----------------------------------------------------
  \ifdefstring{\usertheme@font}{cmr}{
    \RequirePackage{lmodern}
  }{}

  % Times font ----------------------------------------------------------------
  \ifdefstring{\usertheme@font}{times}{
    \RequirePackage{newtxtext}
    \RequirePackage[amssymbols]{newtxmath}
  }{}

  % Utopia font ---------------------------------------------------------------
  \ifdefstring{\usertheme@font}{utopia}{
    \RequirePackage{fourier}
  }{}

  % XeTeX fonts ---------------------------------------------------------------
  \ifdefstring{\usertheme@font}{pagella}{
    \PackageWarningNoLine{UDCfonts}{pagella font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{xits}{
    \PackageWarningNoLine{UDCfonts}{xits font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{minion}{
    \PackageWarningNoLine{UDCfonts}{minion font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{garamond}{
    \PackageWarningNoLine{UDCfonts}{garamond font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{arno}{
    \PackageWarningNoLine{UDCfonts}{arno font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{warnock}{
    \PackageWarningNoLine{UDCfonts}{warnock font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{helvetica}{
    \PackageWarningNoLine{UDCfonts}{helvetica font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{frutiger}{
    \PackageWarningNoLine{UDCfonts}{frutiger font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{futura}{
    \PackageWarningNoLine{UDCfonts}{futura font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{optima}{
    \PackageWarningNoLine{UDCfonts}{optima font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{myriad}{
    \PackageWarningNoLine{UDCfonts}{myriad font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  \ifdefstring{\usertheme@font}{univers}{
    \PackageWarningNoLine{UDCfonts}{univers font option is for XeTeX. Latin Modern selected instead}
    \RequirePackage{lmodern}
  }{}

  % Monospace font ==========================================================

  % Inconsolata font  -------------------------------------------------------
  \ifdefstring{\usertheme@fontmono}{inconsolata}{
    \RequirePackage[var0, varqu]{inconsolata}
  }{}

  % Inconsolata narrow font  ------------------------------------------------
  \ifdefstring{\usertheme@fontmono}{inconsolatan}{
    \RequirePackage[var0, varqu, narrow]{inconsolata}
  }{}

  \newcommand\bmmax{2} % To avoid too many alphabets error. http://www.tex.ac.uk/FAQ-manymathalph.html
  \RequirePackage{bm}
\fi

\RequirePackage{lettrine}
\RequirePackage{microtype}
  }

% Language --------------------------------------------------------------------
\RequirePackage[\usertheme@language, noabbrev, nameinlink]{cleveref}
\RequirePackage{iflang}

\ifPDFTeX%
  \RequirePackage[\usertheme@language]{babel}
  \IfLanguageName{spanish}{%
    \renewcommand\spanishtablename{Tabla}                % babel
    \renewcommand\spanishlisttablename{Índice de tablas} % babel
  }{}
\fi

\ifXeTeX%
  \RequirePackage{polyglossia}
  \setdefaultlanguage{\usertheme@language}
  \selectlanguage{\usertheme@language}
  \IfLanguageName{spanish}{%
    \addto\captionsspanish{%
      \renewcommand{\tablename}{Tabla}%
      \renewcommand{\listtablename}{Índice de tablas}%
      \appto\inlineextras@spanish{\renewcommand\lim{\qopname \relax m{lím}}}
      \appto\blockextras@spanish{\renewcommand\lim{\qopname \relax m{lím}}}
      \appto\inlineextras@spanish{\renewcommand\min{\qopname \relax m{mín}}}
      \appto\blockextras@spanish{\renewcommand\min{\qopname \relax m{mín}}}
      \appto\inlineextras@spanish{\renewcommand\max{\qopname \relax m{máx}}}
      \appto\blockextras@spanish{\renewcommand\max{\qopname \relax m{máx}}}
    }
  }{}
\fi

\IfLanguageName{spanish}{%
  \crefname{table}{tabla}{tablas}                      % cleveref
  \Crefname{table}{Tabla}{Tablas}                      % cleveref
  \sisetup{output-decimal-marker={,}}                  % siunitx
}{}

\IfLanguageName{english}{%
  \sisetup{output-decimal-marker={.}}                  % siunitx
}{}

% Bibliography ----------------------------------------------------------------
\ifusertheme@biblatex

\RequirePackage{csquotes}

% General options
\RequirePackage[
backend=biber,
natbib=true,
bibencoding=utf8,
style=\usertheme@biblatexstyle,
sorting=\usertheme@biblatexsorting,
sortcites=true,
maxbibnames=99,
maxcitenames=2,
isbn=false,
url=false,
eprint=false,
defernumbers=true,
refsegment=chapter,
]{biblatex}

% \RequirePackage[
% backend=biber,
% bibencoding=utf8,
% sorting=\usertheme@biblatexsorting,
% sortcites=true,
% maxbibnames=99,
% maxcitenames=2,
% isbn=false,
% url=false,
% eprint=false,
% defernumbers=true,
% ]{biblatex}

% \renewbibmacro*{textcite}{%
%   \iffieldequals{namehash}{\cbx@lasthash}
%     {\mkbibsuperscript{\supercitedelim}}
%     {\cbx@tempa
%      \ifnameundef{labelname}
%        {\printfield[citetitle]{labeltitle}}
%        {\printnames{labelname}}}%
%   \ifnumequal{\value{citecount}}{1}
%     {}
%     {}%
%   \mkbibsuperscript{\bibopenbracket\usebibmacro{cite}\bibclosebracket}%
%   \savefield{namehash}{\cbx@lasthash}%
%   \gdef\cbx@tempa{\addspace\multicitedelim}}%

% \DeclareCiteCommand{\citet}
%   {\let\cbx@tempa=\empty
%    \undef\cbx@lasthash
%    \iffieldundef{prenote}
%      {}
%      {\BibliographyWarning{Ignoring prenote argument}}%
%    \iffieldundef{postnote}
%      {}
%      {\BibliographyWarning{Ignoring postnote argument}}}
%   {\usebibmacro{citeindex}%
%    \usebibmacro{textcite}}
%   {}
%   {}

% \DeclareCiteCommand{\citep}[\mkbibsuperscript]{
%     \iffieldundef{prenote}
%     {}
%     {\BibliographyWarning{Ignoring prenote argument}}%
%     \iffieldundef{postnote}
%     {}
%     {}
%   }
%   {\bibopenbracket%
%    \usebibmacro{citeindex}%
%    \usebibmacro{cite}%
%    \usebibmacro{postnote}%
%    \bibclosebracket}
%   {\supercitedelim}
%   {}

\DeclareNameAlias{sortname}{last-first} % Put names as last-first
\DeclareNameAlias{default}{last-first} % Put names as last-first

% Style-specific options
\ifboolexpr{ test {\ifdefstring{\usertheme@biblatexstyle}{authoryear-icomp}}}{
  \ExecuteBibliographyOptions{
  dashed=false, % Don't put a dash when multiple references of the same author (in author-year)
  uniquename=init,
  }
}{
  \ExecuteBibliographyOptions{
  giveninits=true, % put only initials on author's names
  }
}

\IfLanguageName{english}{}{\ExecuteBibliographyOptions{safeinputenc}}

\DefineBibliographyStrings{spanish}{%
   andothers  = {et al.},
   phdthesis  = {Tesis doctoral},
 }

\renewbibmacro{in:}{\ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

\AtEveryBibitem{% Clean up the bibtex rather than editing it
  \clearfield{date}
  \clearfield{abstract}
  \clearfield{note}
  \clearlist{language}
  \clearfield{eprint}
  \clearfield{isbn}
  \clearfield{url}
  \clearfield{issn}
  \clearfield{month}
  \clearfield{series}

  % Remove address, publisher and editor except for books
  \ifentrytype{book}{}{
    \clearlist{publisher}
    \clearname{editor}
    \clearlist{address}
    \clearlist{location}
  }
}

% Filters to sort bibliography by document type (e.g: \printbibliography[filter=papers])
\defbibfilter{papers}{
  type=article or
  type=inproceedings
}
\defbibfilter{books}{
  type=book
}

% Put text suffixes as superscripts in the edition field (in spanish this just works in default style)
\IfLanguageName{english}{
  \DeclareLanguageMapping{english}{custom-english-ordinal-sscript}

  \DeclareFieldFormat{edition}%
                     {\ifinteger{#1}%
                      {\mkbibordedition{#1}\addthinspace{}ed.}%
                      {#1\isdot}}
}{}
\fi

% Graphics --------------------------------------------------------------------
\@ifclassloaded{memoir}{\RequirePackage[\usertheme@draft]{graphicx}}{\RequirePackage{graphicx}}

\RequirePackage{pdfpages}

\@ifclassloaded{beamer}{}
  {
  \RequirePackage[abspath]{currfile}
  \ifXeTeX%
    \RequirePackage[mode=buildmissing]{standalone}
  \else
    \RequirePackage[mode=buildnew]{standalone}
  \fi
  }

\ifusertheme@tikz
  \IfFileExists{UDCtikz.sty}{
    \RequirePackage{UDCtikz}
  }{
    \RequirePackage{tikz}
    \usetikzlibrary{
    shapes,
    arrows.meta,
    backgrounds,
    fit,
    shadows.blur,
    trees,
    intersections,
    spy,
    calc,
    fadings,
    }
    \IfFileExists{stanly.sty}{\RequirePackage{stanly}}{}
  }
\fi

\ifusertheme@tcolorbox\AtEndPreamble{\RequirePackage{tcolorbox}\tcbuselibrary{many}}\fi
\ifusertheme@menukeys
  \RequirePackage[os=win]{menukeys}

  % This is to reset text width={} and allow the use of menukeys inside tikzpicture environments
  \tikzset{tw@menus@base/.append style={text width={}}}
  \tikzset{tw@roundedkeys@base/.append style={text width={}}}
\fi

% Captions --------------------------------------------------------------------
\@ifclassloaded{beamer}{
  \newcommand{\subcaption}{\vspace{12pt}}
}{
  \RequirePackage{caption}
  \captionsetup[code]{hypcap=false}
  \RequirePackage{subcaption}
}

% Floats ----------------------------------------------------------------------
% Default float placement
\def\fps@figure{htbp}
\def\fps@table{htbp}

% Show layout -----------------------------------------------------------------
\ifusertheme@showlayout

  % Show layout sketch at the first page
  \RequirePackage{layout}

  \AtBeginDocument{%
    \layout%
    \clearpage
  }

  % Show layouts sketch at the second page
  \RequirePackage{layouts}
  \AtBeginDocument{%
    \printinunitsof{mm}{\pagevalues}\\
    \pagediagram%
    \clearpage
  }

  % Show frames in every page
  \RequirePackage{everypage}
  \RequirePackage{tikzpagenodes}
  \usetikzlibrary{calc}

  \AddEverypageHook{%
    \tikz[remember picture, overlay]{%
      \draw[black, line width=1pt] (current page text area.south west) rectangle (current page text area.north east);
      \draw[blue, line width=1pt] (current page marginpar area.south west) rectangle (current page marginpar area.north east);
      \draw[red, line width=1pt] (current page header area.south west) rectangle (current page header area.north east);
      \draw[red, line width=1pt] (current page footer area.south west) rectangle (current page footer area.north east);
    }
  }

\fi

% Misc ------------------------------------------------------------------------
\ifboolexpr{ test {\@ifclassloaded{beamer}} or test {\@ifclassloaded{elsarticle}} or test {\@ifclassloaded{memoir}}}
{}
{
  \RequirePackage{titlesec}
  \RequirePackage{titletoc}
  \RequirePackage{fancyhdr}
}

\ifboolexpr{ test {\@ifclassloaded{UDClecturenotes}} or test {\@ifclassloaded{UDCinstructorsmanual}}}
{\RequirePackage[noxcolor]{beamerarticle}}{}

\@ifclassloaded{memoir}{}{
  \RequirePackage{versions}
  \ifusertheme@debug
  \else
    \WarningFilter{`Versions'}{Redefining environment}
  \fi
}

\AtEndPreamble{\RequirePackage{currfile-abspath}}

% Macros ----------------------------------------------------------------------

% -----------------------------------------------------------------------------
% Metadata
% -----------------------------------------------------------------------------
\@ifclassloaded{beamer}{}{
  \@ifpackageloaded{beamerarticle}{}{
    \@ifclassloaded{elsarticle}{}{
        \renewcommand*\title[2][]{\def\@shorttitlename{#1}\def\@titlename{#2}}
        \renewcommand*\author[2][]{\def\@shortauthorname{#1}\def\@authorname{#2}}
        \renewcommand*\date[1]{\def\@datename{#1}}
        \date{}
    }
  }
}

\@ifclassloaded{beamer}{}{
  \providecommand*\conference[2][]{\def\@shortconferencename{#1}\def\@conferencename{#2}}
  \providecommand*\course[2][]{\def\@shortcoursename{#1}\def\@coursename{#2}}
  \providecommand*\lessontitle[2][]{\def\@shortlessontitlename{#1}\def\@lessontitlename{#2}}
  \providecommand*\lessonnumber[1]{\def\@lessonnumbername{#1}}
  \providecommand*\degree[2][]{\def\@shortdegreename{#1}\def\@degreename{#2}}
  \providecommand*\institute[2][]{\def\@shortinstitutename{#1}\def\@institutename{#2}}
  \providecommand*\term[1]{\def\@termname{#1}}
  \providecommand*\exam[1]{\def\@examname{#1}}

  \course{}
  \lessontitle{}
  \lessonnumber{}
  \degree{}
  \institute{}
  \term{}
  \exam{}
}

% New beamer fields %----------------------------------------------------------
\ifboolexpr{ test {\@ifclassloaded{beamer}}}
{%
  \def\course{\@dblarg\beamer@course}
  \long\def\beamer@course[#1]#2{%
    \def\insertcourse{#2}%
    \def\beamer@shortcourse{#1}%
  }
  \course{}

  \newcommand\insertshortcourse[1][]{%
    {%
      \let\thanks=\@gobble%
      \beamer@shortcourse
  }}

  \def\lessontitle{\@dblarg\beamer@lessontitle}
  \long\def\beamer@lessontitle[#1]#2{%
    \def\insertlessontitle{#2}%
    \def\beamer@shortlessontitle{#1}%
  }
  \lessontitle{}

  \newcommand\insertshortlessontitle[1][]{%
    {%
      \let\thanks=\@gobble%
      \beamer@shortlessontitle
  }}

  \def\lessonnumber{\@dblarg\beamer@lessonnumber}
  \long\def\beamer@lessonnumber[#1]#2{%
    \def\insertlessonnumber{#2}%
    \def\beamer@shortlessonnumber{#1}%
  }
  \lessonnumber{}

  \newcommand\insertshortlessonnumber[1][]{%
    {%
      \let\thanks=\@gobble%
      \beamer@shortlessonnumber
  }}

  \def\degree{\@dblarg\beamer@degree}
  \long\def\beamer@degree[#1]#2{%
    \def\insertdegree{#2}%
    \def\beamer@shortdegree{#1}%
  }
  \degree{}

  \newcommand\insertshortdegree[1][]{%
    {%
      \let\thanks=\@gobble%
      \beamer@shortdegree
  }}

  \def\conference{\@dblarg\beamer@conference}
  \long\def\beamer@conference[#1]#2{%
    \def\insertconference{#2}%
    \def\beamer@shortconference{#1}%
  }
  \conference{}

  \newcommand\insertshortconference[1][]{%
    {%
      \let\thanks=\@gobble%
      \beamer@shortconference
  }}

  \def\term{\@dblarg\beamer@term}
  \long\def\beamer@term[#1]#2{%
    \def\insertterm{#2}%
    \def\beamer@shortterm{#1}%
  }
  \term{}

  \newcommand\insertshortterm[1][]{%
    {%
      \let\thanks=\@gobble%
      \beamer@shortterm
  }}
}{}

\@ifpackageloaded{beamerarticle}{
  \newcommand{\insertsection}{}
  \newcommand{\insertsubsection}{}
}{}

% -----------------------------------------------------------------------------
% Commands for mixing content between beamer and other classes
% -----------------------------------------------------------------------------
\AtEndPreamble{
  \newcommand{\twocolbeamer}[3][.5\textwidth]{
  \ifpresentation%
    \begin{columns}[T]
      \begin{column}[T]{#1}
        #2
      \end{column}
      \begin{column}[T]{0.97\textwidth - #1}
        #3
      \end{column}
    \end{columns}
  \else
    #2
    #3
  \fi
  }
}

\@ifclassloaded{beamer}{}{
  \@ifpackageloaded{beamerarticle}{}{
    \providecommand{\framebreak}{\relax}
    \providecommand{\structure}{\noindent\textbf}
  }
}

% -----------------------------------------------------------------------------
% Custom commands and environments
% -----------------------------------------------------------------------------
% Exercises %------------------------------------------------------------------
\ifboolexpr{ test {\@ifclassloaded{UDCquestions}} or test {\@ifclassloaded{UDCsolutions}} or test {\@ifclassloaded{UDClecturenotes}} or test {\@ifclassloaded{UDCinstructorsmanual}} or test {\@ifclassloaded{UDCexam}}}
{
  \titleclass{\exesec}{straight}[\section]
  \titleclass{\exesubsec}{straight}[\exesec]
  \titleclass{\exesubsubsec}{straight}[\exesubsec]
  \titleclass{\exesubsubsubsec}{straight}[\exesubsubsec]

  \setcounter{secnumdepth}{4}

  \newcounter{exesec}
  \setcounter{exesec}{0}
  \renewcommand{\theexesec}{\arabic{exesec}}

  \newcounter{exesubsec}[exesec]
  \setcounter{exesubsec}{0}
  \renewcommand{\theexesubsec}{\arabic{exesubsec}}

  \newcounter{exesubsubsec}[exesubsec]
  \setcounter{exesubsubsec}{0}
  \renewcommand{\theexesubsubsec}{\arabic{exesubsubsec}}

  \providecommand*{\toclevel@exesec}{2}
  \providecommand*{\toclevel@exesubsec}{3}
  \providecommand*{\toclevel@exesubsubsec}{4}
  \providecommand*{\toclevel@exesubsubsubsec}{5}
  \setcounter{tocdepth}{2}

  \def\l@exesubsec{\@dottedtocline{4}{7em}{4em}}
  \def\l@exesubsubsec{\@dottedtocline{5}{10em}{5em}}
  \def\l@exesubsubsec{\@dottedtocline{6}{14em}{6em}}

  \crefname{exesec}{ejercicio}{ejercicios}

  \@ifclassloaded{UDCsolutions}{%
    \ifusertheme@includequestions
      \titleformat{\exesec}[runin]{\normalfont\bfseries}{Ejercicio \theexesec.}{.1em}{}[]
    \else
      \titleformat{\exesec}[hang]{\normalfont\bfseries}{Ejercicio \theexesec.}{.1em}{}[]
    \fi
  }{
    \titleformat{\exesec}[runin]{\normalfont\bfseries}{Ejercicio \theexesec.}{.1em}{}[]
  }

  \titleformat{\exesubsec}[hang]{\normalfont\bfseries}{\theexesec.\theexesubsec.\quad}{.1em}{}[]
  \titleformat{\exesubsubsec}[hang]{\normalfont\bfseries}{\theexesec.\theexesubsec.\theexesubsubsec.\quad}{.1em}{}[]

  \titlespacing{\exesec}{0pt}{2ex plus 1.ex minus 1.ex}{.5em}
  \titlespacing{\exesubsec}{0pt}{1ex plus .5ex minus .5ex}{.5em}
  \titlespacing{\exesubsubsec}{0pt}{0.5ex plus .5ex minus .5ex}{.5em}

  \titlecontents{exesec}
                [6.5em] % ie, 1.5em (chapter) + 5em
                {}
                {\contentslabel[Ejercicio \thecontentslabel]{5em}}
                {\hspace*{-2.3em}}
                {\titlerule*[0.9pc]{.}\contentspage}

  \def\exercisesavesections{
    \let\latex@section\section
    \let\latex@subsection\subsection
    \let\latex@subsubsection\subsubsection
    \let\section\exesubsec
    \let\subsection\exesubsubsec
  }

  \def\exerciserestoresections{
    \let\section\latex@section
    \let\subsection\latex@subsection
    \let\subsubsection\latex@subsubsection
  }

  \@ifclassloaded{UDCexam}{%
    \newenvironment{exercise}[2]{\createtitlepage{}\exercisesavesections\exesec{(#1 - #2 puntos)}}
    {\ifusertheme@grid
      \checkoddpage
      \ifoddpage
        \par
        \drawGrid%
        \clearpage%
        \drawGrid%
      \else
        \par
        \drawGrid%
        \clearpage%
      \fi
    \fi
    \exerciserestoresections}
  }{
    \@ifclassloaded{UDCinstructorsmanual}{%
      \newenvironment{exercise}[2]{\exercisesavesections\clearpage\exesec{}}{\exerciserestoresections}
    }{
    \@ifclassloaded{UDCsolutions}{%
    \ifusertheme@newpageexercise
      \newenvironment{exercise}[2]{\exercisesavesections\exesec{}}{\exerciserestoresections\clearpage}
    \else
      \newenvironment{exercise}[2]{\exercisesavesections\exesec{}}{\exerciserestoresections}
    \fi
    }{
      \newenvironment{exercise}[2]{\exercisesavesections\exesec{}}{\exerciserestoresections}
    }
    }
  }
}
{}

\@ifclassloaded{beamer}{%
  \newcounter{exercisenumber}
  \newenvironment{exercise}[2]{
  \stepcounter{exercisenumber}\subsection{Ejercicio \arabic{exercisenumber}}
  \begin{frame}{\insertsubsection}%
  \footnotesize%
  % Disable captions in figures
  \setlength\abovecaptionskip{-5pt}
  \setlength\belowcaptionskip{-5pt}
  \setbeamertemplate{caption}{%
    \usebeamercolor[fg]{caption name}%
    \usebeamerfont*{caption name}%
    \par}
  }{
  \end{frame}
  }
}{}

% Titlepage %------------------------------------------------------------------
% UDCexam
\@ifclassloaded{UDCexam}{%
  \newcommand{\createtitlepage}[1]{
    \cleardoublepage%
    \vspace{-4ex}
    \noindent
    \begin{tabular*}{\textwidth}{@{}ll@{\extracolsep{\fill}}r@{}}
      \includegraphics[width=0.4\textwidth]{logo_udc_text_bn}& &\\[2ex]
      \multicolumn{2}{@{}l}{\textbf{\@coursename}. \textbf{\@degreename}} &\textbf{Curso \@termname}\\[4ex]
      \textbf{\@examname} - \textbf{\@datename}  & \multicolumn{2}{r@{}}{\textbf{Alumno:}  \makebox[65mm]{\hrulefill}}\\
    \end{tabular*}\\
    \rule[2ex]{\textwidth}{2pt}
    \vspace{-5ex}
  }
}{}

% UDCquestions, UDCsolutions, UDClecturenotes, UDCinstructorsmanual
\ifboolexpr{ test {\@ifclassloaded{UDCquestions}} or test {\@ifclassloaded{UDCsolutions}} or test {\@ifclassloaded{UDClecturenotes}} or test {\@ifclassloaded{UDCinstructorsmanual}} }
{%
  \newcommand{\createtitlepage}[1]{
    \cleardoublepage%
    \vspace{-4ex}
    \noindent
    \begin{tabular*}{\textwidth}{@{}ll@{\extracolsep{\fill}}r@{}}
      \includegraphics[width=0.4\textwidth]{logo_udc_text_bn}& &\\[2ex]
      \multicolumn{2}{@{}l}{\textbf{\@coursename}. \textbf{\@degreename}} &\textbf{Curso \@termname}\\[2ex]
      \textbf{Tema \@lessonnumbername. \@lessontitlename} & & \textbf{#1}\\
    \end{tabular*}\\
    \rule[2ex]{\textwidth}{2pt}
    \vspace{-2ex}
  }
}{}

\@ifclassloaded{UDCquestions}{
  \AfterEndPreamble{
    \ifusertheme@twocolumn
      \twocolumn[\createtitlepage{Ejercicios}]
    \else
      \createtitlepage{Ejercicios}
    \fi
  }
}

\@ifclassloaded{UDCsolutions}{
  \AfterEndPreamble{
    \ifusertheme@twocolumn
      \twocolumn[\createtitlepage{Ejercicios resueltos}]
    \else
      \createtitlepage{Ejercicios resueltos}
    \fi
  }
}

\@ifclassloaded{UDClecturenotes}{\AfterEndPreamble{\createtitlepage{Apuntes de clase}}}{}
\@ifclassloaded{UDCinstructorsmanual}{\AfterEndPreamble{\createtitlepage{Notas del profesor}}}{}

% -----------------------------------------------------------------------------
% Booleans
% -----------------------------------------------------------------------------
% \iftwocolumn
\newcommand{\iftwocolumn}[2]{\ifusertheme@twocolumn #1 \else #2 \fi}

% \ifpresentation
\expandafter\ifx\csname ifpresentation\endcsname\relax\else
  \expandafter\endinput
\fi
\newif\ifpresentation
\begingroup\expandafter\expandafter\expandafter\endgroup
\expandafter

\@ifclassloaded{beamer}{\presentationtrue}{\presentationfalse}

% \ifdraft
\expandafter\ifx\csname ifdraft\endcsname\relax\else
  \expandafter\endinput
\fi
\newif\ifdraft
\begingroup\expandafter\expandafter\expandafter\endgroup
\expandafter
\draftfalse

% Silence some warnings -------------------------------------------------------
\ifusertheme@debug
\else
  \WarningFilter{latex}{Empty bibliography}
  \WarningFilter{blindtext}{spanish not defined, using English instead}
\fi

% Document and text sizes -----------------------------------------------------
\ifcase\value{idusertheme@documentsize}\relax
  % A4 ........................................................................
  \setstocksize{297mm}{210mm}
  \settrimmedsize{\stockheight}{\stockwidth}{*}
  \settrims{0mm}{0mm}
  \settypeblocksize{*}{420pt}{1.4142}
  \setulmargins{114pt}{*}{*}
  \setlrmargins{*}{*}{1.5}
  \setheadfoot{\onelineskip}{2\onelineskip}
  \setheaderspaces{*}{2\onelineskip}{*}
  \setmarginnotes{14pt}{28pt}{\onelineskip}
\or%
  % Octavo ....................................................................
  \ifusertheme@printmode
    \setstocksize{297mm}{210mm}
    \settrimmedsize{228mm}{152.5mm}{*}
    \settrims{34.5mm}{28.75mm}
  \else
    \setstocksize{228mm}{152.5mm}
    \settrimmedsize{228mm}{152.5mm}{*}
    \settrims{0mm}{0mm}
  \fi
  \settypeblocksize{*}{348pt}{1.4142}
  \setulmargins{72pt}{*}{*}
  \setlrmargins{*}{*}{1.5}
  \setheadfoot{\onelineskip}{2\onelineskip}
  \setheaderspaces{*}{2\onelineskip}{*}
  \setmarginnotes{14pt}{18pt}{\onelineskip}
\fi
\checkandfixthelayout%

% Increase linespace ----------------------------------------------------------
\ifusertheme@onehalfspacing
  \OnehalfSpacing%
\fi

% Language --------------------------------------------------------------------
\IfLanguageName{english}{%
  \addto{\captionsenglish}{\def\prefacename{Preface}}
  \addto{\captionsenglish}{\def\acknowledgementsname{Acknowledgments}}
  \addto{\captionsenglish}{\def\notationname{Notation}}
  \addto{\captionsenglish}{\def\notationgreekletters{Greek letters}}
  \addto{\captionsenglish}{\def\notationromanletters{Latin letters}}
  \addto{\captionsenglish}{\def\notationacronyms{Acronyms}}
  \addto{\captionsenglish}{\def\phdname{Doctoral Thesis}}
  \addto{\captionsenglish}{\def\mscname{Master's Thesis}}
  \addto{\captionsenglish}{\def\ptname{Technical Project}}
  \ifdefstring{\usertheme@degree}{\phdname}{\addto{\captionsenglish}{\def\bystring{By}}}{}
  \ifdefstring{\usertheme@degree}{\mscname}{\addto{\captionsenglish}{\def\bystring{By}}}{}
  \ifdefstring{\usertheme@degree}{\ptname}{\addto{\captionsenglish}{\def\bystring{By}}}{}
  \ifdefstring{\usertheme@degree}{\phdname}{\addto{\captionsenglish}{\def\supervisorstring{Supervisor}}}{}
  \ifdefstring{\usertheme@degree}{\mscname}{\addto{\captionsenglish}{\def\supervisorstring{Supervisor}}}{}
  \ifdefstring{\usertheme@degree}{\ptname}{\addto{\captionsenglish}{\def\supervisorstring{Supervisor}}}{}
  \ifdefstring{\usertheme@degree}{\phdname}{\addto{\captionsenglish}{\def\supervisorpluralstring{Supervisors}}}{}
  \ifdefstring{\usertheme@degree}{\mscname}{\addto{\captionsenglish}{\def\supervisorpluralstring{Supervisors}}}{}
  \ifdefstring{\usertheme@degree}{\ptname}{\addto{\captionsenglish}{\def\supervisorpluralstring{Supervisors}}}{}
}{}

\IfLanguageName{spanish}{%
  \addto{\captionsenglish}{\def\prefacename{Prefacio}}
  \addto{\captionsspanish}{\def\acknowledgementsname{Agradecimientos}}
  \addto{\captionsspanish}{\def\notationname{Notación}}
  \addto{\captionsspanish}{\def\acronymname{Lista de acrónimos}}
  \addto{\captionsspanish}{\def\notationgreekletters{Letras griegas}}
  \addto{\captionsspanish}{\def\notationromanletters{Letras latinas}}
  \addto{\captionsspanish}{\def\notationacronyms{Acrónimos}}
  \addto{\captionsspanish}{\def\phdname{Tesis doctoral}}
  \addto{\captionsspanish}{\def\mscname{Trabajo fin de máster}}
  \addto{\captionsspanish}{\def\ptname{Proyecto técnico}}
  \ifdefstring{\usertheme@degree}{\phdname}{\addto{\captionsspanish}{\def\bystring{Por}}}{}
  \ifdefstring{\usertheme@degree}{\mscname}{\addto{\captionsspanish}{\def\bystring{Por}}}{}
  \ifdefstring{\usertheme@degree}{\ptname}{\addto{\captionsspanish}{\def\bystring{Por}}}{}
  \ifdefstring{\usertheme@degree}{\phdname}{\addto{\captionsspanish}{\def\supervisorstring{Dirigida por}}}{}
  \ifdefstring{\usertheme@degree}{\mscname}{\addto{\captionsspanish}{\def\supervisorstring{Dirigido por}}}{}
  \ifdefstring{\usertheme@degree}{\ptname}{\addto{\captionsspanish}{\def\supervisorstring{Dirigido por}}}{}
  \ifdefstring{\usertheme@degree}{\phdname}{\addto{\captionsspanish}{\def\supervisorpluralstring{Dirigida por}}}{}
  \ifdefstring{\usertheme@degree}{\mscname}{\addto{\captionsspanish}{\def\supervisorpluralstring{Dirigido por}}}{}
  \ifdefstring{\usertheme@degree}{\ptname}{\addto{\captionsspanish}{\def\supervisorpluralstring{Dirigido por}}}{}
  \renewcommand{\appendixpagename}{Apéndices}
  \renewcommand{\appendixtocname}{Apéndices}
}{}

% Commands --------------------------------------------------------------------
\RenewDocumentCommand{\title}{O{#2}m}{\def\@title{#2}\hypersetup{pdftitle={#1}}}
\renewcommand*\author[1]{\def\@authorname{#1}\hypersetup{pdfauthor={#1}}}
\newcommand*\authortitle[1]{\def\@authortitle{#1}}
\newcommand*\supervisor[1]{\def\@supervisorname{#1}}
\newcommand*\supervisortitle[1]{\def\@supervisortitle{#1}}
\newcommand*\cosupervisor[1]{\def\@cosupervisorname{#1}}
\newcommand*\cosupervisortitle[1]{\def\@cosupervisortitle{#1}}
\renewcommand*\date[1]{\def\@datename{#1}}
\newcommand*\city[1]{\def\@cityname{#1}}
\def\@doctoralprogramme{Programa de doctorado en Ingeniería Civil}

\title{}
\author{}
\date{}
\supervisor{}

\AtEndPreamble{
  \ifdefstring{\@title}{}{\PackageWarningNoLine{UDCthesis}{title command is empty}}{}
  \ifdefstring{\@authorname}{}{\PackageWarningNoLine{UDCthesis}{author command is empty}}{}
  \ifdefstring{\@supervisorname}{}{\PackageWarningNoLine{UDCthesis}{supervisor command is empty}}{}
  \ifdefstring{\@datename}{}{\PackageWarningNoLine{UDCthesis}{date command is empty}}{}
  \ifdefstring{\@authortitle}{}{\PackageWarningNoLine{UDCthesis}{authortitle command is empty}}{}
  \ifdefstring{\@supervisortitle}{}{\PackageWarningNoLine{UDCthesis}{supervisortitle command is empty}}{}
  \ifdefstring{\@cosupervisortitle}{}{\PackageWarningNoLine{UDCthesis}{cosupervisortitle command is empty}}{}
}

% Captions --------------------------------------------------------------------
% Caption name and number in bold
% Caption text in smaller size
\captionsetup{labelfont={bf,small},textfont={small}}

% Floats ----------------------------------------------------------------------
% Space between floats
% \textfloatsep — distance between floats on the top or the bottom and the text;
% \floatsep — distance between two floats;
% \intextsep — distance between floats inserted inside the page text (using h) and the text proper
% \dbltextfloatsep — distance between a float spanning both columns and the text;
% \dblfloatsep — distance between two floats spanning both columns.
\setlength\floatsep{0.8\baselineskip plus 3pt minus 2pt}
\setlength\textfloatsep{0.8\baselineskip plus 3pt minus 2pt}
\setlength\intextsep{0.8\baselineskip plus 3pt minus 2 pt}
\setlength\dbltextfloatsep{0.8\baselineskip plus 3pt minus 2 pt}
\setlength\dblfloatsep{0.8\baselineskip plus 3pt minus 2 pt}

% Table of contents -----------------------------------------------------------
\ifusertheme@frontmatterintoc
  \renewcommand\@pnumwidth{3em}
\else
  \renewcommand\@pnumwidth{1.75em}
\fi
\settocdepth{subsection}

% Chapters --------------------------------------------------------------------
\makechapterstyle{udc}{%
  \renewcommand*{\printchaptername}{\centering}
  \renewcommand*{\printchapternum}{\chapnumfont \thechapter}
  \renewcommand*{\chaptitlefont}{\normalfont\Huge\sffamily}
  \renewcommand*{\printchaptertitle}[1]{%
    \hrule\vskip\onelineskip \raggedleft \chaptitlefont ##1}
  \renewcommand*{\afterchaptertitle}{%
    \vskip\onelineskip \hrule\vskip \afterchapskip}
  \setlength{\beforechapskip}{3\baselineskip}
  \renewcommand*{\printchapternonum}{%
    \vphantom{\chapnumfont One}
    \afterchapternum%
    \vskip\topskip}
  \setlength{\beforechapskip}{2\onelineskip}
}

\chapterstyle{udc}
\setsecnumdepth{subsection}

\ifusertheme@biblatexchapterbib
  \let\oldchapter\chapter%
  \renewcommand{\chapter}{%
    \ifnum\value{chapter}>0\relax
      \printbibliography[segment=\therefsegment,heading=subbibliography]
    \fi
    \oldchapter%
  }
\fi

% Sections and the rest -------------------------------------------------------
% \setsecheadstyle{\Large\sffamily\raggedright}

% Page styles -----------------------------------------------------------------
\nouppercaseheads% The titles in the headings pagestyle will not be automatically uppercased

\copypagestyle{UDC}{companion}
\copypagestyle{psfrontmatter}{companion}
\copypagestyle{pspreface}{companion}
\copypagestyle{psacknowledgements}{companion}
\copypagestyle{psabstracten}{companion}
\copypagestyle{psabstractes}{companion}
\copypagestyle{psabstractga}{companion}
\aliaspagestyle{chapter}{empty}

\makeevenhead{pspreface}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries\prefacename}
\makeoddhead{pspreface}{\normalfont\bfseries\prefacename}{}{\normalfont\bfseries\thepage}
\makeevenhead{psacknowledgements}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries\acknowledgementsname}
\makeoddhead{psacknowledgements}{\normalfont\bfseries\acknowledgementsname}{}{\normalfont\bfseries\thepage}
\makeevenhead{psabstracten}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries Abstract}
\makeoddhead{psabstracten}{\normalfont\bfseries Abstract}{}{\normalfont\bfseries\thepage}
\makeevenhead{psabstractes}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries Resumen}
\makeoddhead{psabstractes}{\normalfont\bfseries Resumen}{}{\normalfont\bfseries\thepage}
\makeevenhead{psabstractga}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries Resumo}
\makeoddhead{psabstractga}{\normalfont\bfseries Resumo}{}{\normalfont\bfseries\thepage}

\makeevenhead{UDC}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries\@chapapp~\thechapter}
\makeoddhead{UDC}{\normalfont\bfseries\truncate{.85\headwidth}{\rightmark}}{}{\normalfont\bfseries\thepage}

\AtBeginBibliography{%
  \makeevenhead{UDC}{\normalfont\bfseries\thepage}{}{\normalfont\bfseries Bibliography}
}

% Title page ------------------------------------------------------------------
\renewcommand*\maketitle{%
  \pagestyle{empty}

  % Title logos ...............................................................
  \ifcase\value{idusertheme@titlelogo}\relax
    % Title page without logos
  \or%
    % Title page with UDC logo
    \begin{tikzpicture}[remember picture, overlay]
      \path[draw] (current page.center) ++
        (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
        (0,0.40\paperheight)
        node {\includegraphics[width=0.8\paperwidth]{logo_udc_text}};
    \end{tikzpicture}
  \or%
    % Title page with UDC and ICCP logo
    \ifcase\value{idusertheme@documentsize}\relax
      % A4 size
      \begin{tikzpicture}[remember picture, overlay]
        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (-0.34\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.07\paperheight]{logo_udc}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (+0.33\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.1\paperheight]{logo_iccp}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (0,0.40\paperheight)
          node[text width=0.7\paperwidth,align=center] {
            {\Large\bfseries\MakeUppercase{Universidade da Coruña}\\[0.007\paperheight]}
            {\large\upshape\bfseries Escuela Técnica Superior de Ingenieros\\[0.005\paperheight]de Caminos, Canales y Puertos}
          };
      \end{tikzpicture}
    \or%
      % Octavo size
      \begin{tikzpicture}[remember picture, overlay]
        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (-0.37\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.07\paperheight]{logo_udc}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (+0.35\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.1\paperheight]{logo_iccp}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (0,0.40\paperheight)
          node[text width=0.7\paperwidth,align=center] {
            {\Large\bfseries\MakeUppercase{Universidade da Coruña}\\[0.007\paperheight]}
            {\large\upshape\bfseries Escuela Técnica Superior de Ingenieros\\[0.005\paperheight]de Caminos, Canales y Puertos}
          };
      \end{tikzpicture}
    \fi
  \or%
    % Title page with UDC and MIEMA logo
    \ifcase\value{idusertheme@documentsize}\relax
      % A4 size
      \begin{tikzpicture}[remember picture, overlay]
        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (-0.34\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.07\paperheight]{logo_udc}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (+0.33\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.1\paperheight]{logo_miema}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (0,0.40\paperheight)
          node[text width=0.7\paperwidth,align=center] {
          \Large\bfseries\MakeUppercase{Universidade da Coruña}\\[0.007\paperheight]
          \large\upshape\bfseries Máster en Ingeniería de Estructuras\\[0.005\paperheight]y Materiales Aeroespaciales
          };
      \end{tikzpicture}
    \or%
      % Octavo size
      \begin{tikzpicture}[remember picture, overlay]
        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (-0.37\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.07\paperheight]{logo_udc}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (+0.35\paperwidth,0.40\paperheight)
          node {\includegraphics[height=0.1\paperheight]{logo_miema}};

        \path[draw] (current page.center) ++
          (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
          (0,0.40\paperheight)
          node[text width=0.7\paperwidth,align=center] {
          \Large\bfseries\MakeUppercase{Universidade da Coruña}\\[0.007\paperheight]
          \large\upshape\bfseries Máster en Ingeniería de Estructuras\\[0.005\paperheight]y Materiales Aeroespaciales
          };
      \end{tikzpicture}
    \fi
  \fi

  % Title .....................................................................
  \ifcase\value{idusertheme@documentsize}\relax
    \def\usertheme@titletextwidth{0.85\paperwidth}
    \def\usertheme@titletextfontsize{\Huge}
  \or%
    \def\usertheme@titletextwidth{0.85\paperwidth}
    \def\usertheme@titletextfontsize{\huge}
  \fi

  \begin{tikzpicture}[remember picture, overlay]
    \path[draw] (current page.center) ++
      (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
      (0,0.15\paperheight)
      node[text width=\usertheme@titletextwidth,align=center] {
      \LARGE\textsc{\usertheme@degree}
      \vspace{0.075\paperheight}
      \hrule\vskip 8pt \usertheme@titletextfontsize\textbf{\nohyphens{\@title}} \vskip 8pt\hrule
      };
  \end{tikzpicture}

  % Author ....................................................................
  \begin{tikzpicture}[remember picture, overlay]
    \path[draw] (current page.center) ++
      (0.5\stockwidth-0.5\paperwidth,0.5\stockheight-0.5\paperheight) ++
      (0,-0.20\paperheight)
      node[text width=\usertheme@titletextwidth,align=center] {

      \ifusertheme@printby
        \large\textsc{\bystring}\\
      \fi
      \LARGE\textbf{\@authorname}\\
      \ifdef{\@authortitle}{\large \@authortitle~\\}{}

      \vspace{0.05\paperheight}

      \ifdef{\@cosupervisorname}{\large\textsc{\supervisorpluralstring}\\}{\large\textsc{\supervisorstring}\\}

      \ifdefstring{\usertheme@degree}{\phdname}{}{\vspace{0.01\paperheight}}

      \large \textbf{\@supervisorname}\\
      \ifdef{\@supervisortitle}{\large\@supervisortitle~\\}{}
      \vspace{0.01\paperheight}
      \ifdef{\@cosupervisorname}{\large\textbf{\@cosupervisorname}\\}{}
      \ifdef{\@cosupervisortitle}{\large\@cosupervisortitle~\\}{}

      \vspace{0.075\paperheight}
      \ifdefstring{\usertheme@degree}{\phdname}{\@doctoralprogramme}{}

      \vspace{0.025\paperheight}
      \@datename

    };
  \end{tikzpicture}

  \cleardoublepage%

}

% Abstracts -------------------------------------------------------------------
\RequirePackage{collect}

\definecollection{abstracten}
\ifusertheme@frontmatterintoc
  \newenvironment{abstracten}
    {\@nameuse{collect}{abstracten}
      {\pagestyle{psabstracten}%
        \chapter*{Abstract}%
        \addcontentsline{toc}{chapter}{Abstract}%
      }
      {\cleardoublepage}{}{}
    }
    {\@nameuse{endcollect}}
\else
  \newenvironment{abstracten}
    {\@nameuse{collect}{abstracten}
      {\pagestyle{psabstracten}%
        \chapter*{Abstract}%
      }
      {\cleardoublepage}{}{}
    }
    {\@nameuse{endcollect}}
\fi

\definecollection{abstractes}
\ifusertheme@frontmatterintoc
  \newenvironment{abstractes}
    {\@nameuse{collect}{abstractes}
      {\pagestyle{psabstractes}%
        \chapter*{Resumen}%
        \addcontentsline{toc}{chapter}{Resumen}%
      }
      {\cleardoublepage}{}{}
    }
    {\@nameuse{endcollect}}
\else
  \newenvironment{abstractes}
    {\@nameuse{collect}{abstractes}
      {\pagestyle{psabstractes}%
        \chapter*{Resumen}%
      }
      {\cleardoublepage}{}{}
    }
    {\@nameuse{endcollect}}
\fi

\definecollection{abstractga}
\ifusertheme@frontmatterintoc
  \newenvironment{abstractga}
    {\@nameuse{collect}{abstractga}
      {\pagestyle{psabstractga}%
        \chapter*{Resumo}%
        \addcontentsline{toc}{chapter}{Resumo}%
      }
      {\cleardoublepage}{}{}
    }
    {\@nameuse{endcollect}}
\else
  \newenvironment{abstractga}
    {\@nameuse{collect}{abstractga}
      {\pagestyle{psabstractga}%
        \chapter*{Resumo}%
      }
      {\cleardoublepage}{}{}
    }
    {\@nameuse{endcollect}}
\fi

% Preface ---------------------------------------------------------------------
\definecollection{preface}
\ifusertheme@frontmatterintoc
\newenvironment{preface}
  {\@nameuse{collect}{preface}
    {\pagestyle{pspreface}%
      \chapter*{\prefacename}%
      \addcontentsline{toc}{chapter}{\prefacename}%
    }
    {\cleardoublepage}{}{}
  }
  {\@nameuse{endcollect}}
\else
\newenvironment{preface}
  {\@nameuse{collect}{preface}
    {\pagestyle{pspreface}%
      \chapter*{\prefacename}%
    }
    {\cleardoublepage}{}{}
  }
  {\@nameuse{endcollect}}
\fi

% Acknowledgements ------------------------------------------------------------
\definecollection{acknowledgements}
\ifusertheme@frontmatterintoc
\newenvironment{acknowledgements}
  {\@nameuse{collect}{acknowledgements}
    {\pagestyle{psacknowledgements}%
      \chapter*{\acknowledgementsname}%
      \addcontentsline{toc}{chapter}{\acknowledgementsname}%
    }
    {\cleardoublepage}{}{}
  }
  {\@nameuse{endcollect}}
\else
\newenvironment{acknowledgements}
  {\@nameuse{collect}{acknowledgements}
    {\pagestyle{psacknowledgements}%
      \chapter*{\acknowledgementsname}%
    }
    {\cleardoublepage}{}{}
  }
  {\@nameuse{endcollect}}
\fi

% Dedication ------------------------------------------------------------------
\definecollection{dedication}
\newenvironment{dedication}
  {\@nameuse{collect}{dedication}{%
    \pagestyle{empty}%
    \begin{flushright}
    \begin{minipage}[t]{0.7\linewidth}
    \vspace{0.1\textheight}
    \raggedleft%
    \large
    }{
    \vskip 6pt\hrule
    \end{minipage}
    \end{flushright}
    \vfill
    \cleardoublepage}{}{}
  }
  {\@nameuse{endcollect}}

% Epigraphs -------------------------------------------------------------------
\ifusertheme@epigraphs
  \renewcommand{\epigraphsize}{\small}
  \setlength{\epigraphwidth}{0.5\textwidth}
  \setlength{\epigraphrule}{0pt}
  \setlength{\beforeepigraphskip}{.4\baselineskip}
  \setlength{\afterepigraphskip}{.6\baselineskip}
  \xpatchcmd{\@epitext}{\vspace*{1ex}}{\vspace*{2ex}}{}{patch FAIL}
\else
  \renewcommand{\epigraph}[2]{}
\fi

% Draft version ---------------------------------------------------------------
\ifusertheme@draft
  \makeevenfoot{empty}{}{\thepage}{\texttt{Draft: \today}}
  \makeoddfoot{empty}{\texttt{Draft: \today}}{\thepage}{}
  \makeevenfoot{UDC}{}{}{\texttt{Draft: \today}}
  \makeoddfoot{UDC}{}{}{\texttt{Draft: \today}}

  \RequirePackage[firstpage=true,color=gray]{background}
  \backgroundsetup{contents={DRAFT}}
\fi

% Appendix --------------------------------------------------------------------
\let\oldappendix=\appendix
\renewcommand{\appendix}[1]{%
  \ifusertheme@biblatexchapterbib
    \printbibliography[segment=\therefsegment,heading=subbibliography]
  \fi
  \cleardoublepage%
  \appendixpage%
  \oldappendix%
}

% -----------------------------------------------------------------------------
% Frontmatter
% -----------------------------------------------------------------------------
\AfterEndPreamble{
  \frontmatter

  \ifusertheme@titlepage \maketitle \fi

  \ifusertheme@dedication \includecollection{dedication} \fi

  \aliaspagestyle{cleared}{companion} % if \cleardoublepage will result in an empty verso page it calls \thispagestyle{cleared} for the empty page.

  \ifusertheme@preface \includecollection{preface} \fi

  \ifusertheme@acknowledgements \includecollection{acknowledgements} \fi

  \IfLanguageName{spanish}{%
    \ifusertheme@abstractes \includecollection{abstractes} \fi
    \ifusertheme@abstracten \includecollection{abstracten} \fi
    \ifusertheme@abstractga \includecollection{abstractga} \fi
  }{}%

  \IfLanguageName{english}{%
    \ifusertheme@abstracten \includecollection{abstracten} \fi
    \ifusertheme@abstractes \includecollection{abstractes} \fi
    \ifusertheme@abstractga \includecollection{abstractga} \fi
  }{}%

  \pagestyle{psfrontmatter}

  \ifusertheme@frontmatterintoc
    \ifusertheme@toc
      \cleardoublepage%
      \tableofcontents
    \fi
    \ifusertheme@lof
      \cleardoublepage%
      \listoffigures
    \fi
    \ifusertheme@lot
      \cleardoublepage%
      \listoftables
    \fi
  \else
    \ifusertheme@toc
      \cleardoublepage%
      \tableofcontents*
    \fi
    \ifusertheme@lof
      \cleardoublepage%
      \listoffigures*
    \fi
    \ifusertheme@lot
      \cleardoublepage%
      \listoftables*
    \fi
  \fi

  \ifusertheme@notation
    \chapter*{\notationname}
    \ifusertheme@frontmatterintoc \addcontentsline{toc}{chapter}{\notationname} \fi
    \printglossaries%
  \fi
}

% -----------------------------------------------------------------------------
% Mainmatter
% -----------------------------------------------------------------------------
\AfterEndPreamble{
  \mainmatter%
  \aliaspagestyle{cleared}{UDC}
  \pagestyle{UDC}
}
