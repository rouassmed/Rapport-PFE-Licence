\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{deagsm}[1999/06/01\space
           LaTeX2e document class^^J
===========(deagsm\space S.Derrode, EGIM - Institut Fresnel)============^^J
This class has been inspired from thloria, D. Roegel, LORIA]

%% Possibilités Offertes actuellement :
%%
%%%%  3 Styles d'en-tête de chapitres
%% --> option ChapStyle0 (normal book), ChapStyle1 (Chiffres en
%%     Grand), ChapStyle2 (numerotation ordinale des chapitres)
%%
%%%%  Quelques Defines de symboles mathématiques (ensemble Z, R, N...)
%%
%%%%  commandes pour produire les Chapitres spéciaux :
%% --> \Resume \Abstract \Introduction \Conclusion \Remerciements
%%
%%%%  Environnement Dedicace
%% --> \begin{DeaDedication}
%%     \end{DeaDedication}
%%
%%%%  Renommage de labels en style French (Figure., ...)
%%
%%%%  Option draft
%% --> Double interligne c'est tout !
%%
%%%% le package Caption2.sty est utilisé pour avoir des captions plus
%%   jolis ! Neanmoins ce package n'est pas toujours disponible dans
%%   les distributions latex standard... a recuper sur le site
% ftp://ftp.loria.fr/pub/ctan/macros/latex/contrib/supported/caption/caption2.dtx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definition des Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Option draft
\newif\if@draft
\@draftfalse
\DeclareOption{draft}{%
  \@drafttrue
  }

%% Styles de chapitre
\newif\if@style@chapLargeNum
\@style@chapLargeNumfalse
\DeclareOption{ChapStyle1}{%
  \@style@chapLargeNumtrue
  \@style@chapOrdinalfalse
  \@style@chapDefaultfalse
  }
\newif\if@style@chapOrdinal
\@style@chapOrdinalfalse
\DeclareOption{ChapStyle2}{%
  \@style@chapOrdinaltrue
  \@style@chapLargeNumfalse
  \@style@chapDefaultfalse
  }
\newif\if@style@chapDefault
\@style@chapDefaulttrue % Style par défaut
\DeclareOption{ChapStyle0}{%
  \@style@chapOrdinalfalse
  \@style@chapLargeNumfalse
  \@style@chapDefaulttrue
  }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper]{book}[1995/01/31]

\RequirePackage[utf8]{inputenc}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Page de Titre                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Commandes disponibles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% \DeaKind            Thèse
%% \DeaDate            --- (Champ Obligatoire)
%% \DeaPresented       présentée
%% \DeaPresentedThe    soutenue le `date' devant la commission d'examen~:
%% \DeaBefore          EGIM et Fresnel
%% \DeaAuthor          --- (Champ Obligatoire)
%% \DeaTitle           --- (Champ Obligatoire)
%%
%% \ClearAffil  : Reinitialise les champs d'affiliation
%% \ClearJury   : Reinitialise les champs du Jury
%% \NewAffilCategory : Ajoute une catégorie d'affiliation
%%    Les catégories préexistantes sont : Equipe(s)Accueil, Ecole(s)Doctorale(s)
%%    la mise a jour se fait comme suit :
%%        \EquipeAccueil = {Departement Toto,\\ENST Bretagne}
%% \NewJuryCategory : Meme chose avec les catégories prédéfinies :
%%    President, Rapporteurs, Examinateurs, Invites
%%
%% \MakeDeaTitlePage  !!! LA commande pour creer la page de titre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                               % Titre stage
\newcommand{\@TitreStage}%
{{\UseEntryFont{TitreStage}%
    \fbox{\'ecrire \tt\char`\\TitreStage\{ le titre du stage \}}}}
\newcommand\TitreStage[1]%
{\renewcommand{\@TitreStage}{{\UseEntryFont{DeaTitle}#1}}}

                               % Date de la soutenance
\newcommand{\@DeaDate}{\fbox{{\tt\char`\\DeaDate}}}
\newcommand\DeaDate[1]{\renewcommand{\@DeaDate}{#1}}

                               % présentée
\newcommand{\@DeaPresented}{{\UseEntryFont{DeaPresented}présenté
    par}}
\newcommand\DeaPresented[1]%
{\renewcommand{\@DeaPresented}{{\UseEntryFont{DeaPresented}#1}}}

                                % soutenu le ...
\newcommand{\@DeaPresentedThe}{{\UseEntryFont{DeaPresentedThe}%
    soutenu le \@DeaDate{}}}
\newcommand\DeaPresentedThe[1]%
{\renewcommand{\@DeaPresentedThe}{{\UseEntryFont{DeaPresentedThe}#1}}}

                              % DEA Optique ...
\newcommand{\@NomDEA}{
    {\UseEntryFont{DeaAffil}%
        DEA Optique, Image et Signal}\\[0.1em]
    {\UseEntryFont{DeaAffil}%
        \emph{Option Traitement d'Images}}
    }
\newcommand\NomDEA[1]%
{\renewcommand{\@NomDEA}{{\UseEntryFont{DeaJury}#1}}}

                            % Stage 3ieme année ...
\newcommand{\@NomStage}%
{{\UseEntryFont{DeaAffil}%
    \fbox{\'ecrire \tt\char`\\NomStage\{ le nom du stage \}}}}
\newcommand\NomStage[1]%
{\renewcommand{\@NomStage}{{\UseEntryFont{DeaAffil}#1}}}

                               % DEVANT L'UNIVERSITE DE RENNES 1
\newcommand{\@DeaBefore}%
{{\UseEntryFont{DeaBefore}%
    \begin{tabular}{ccc}
      \parbox[t][3cm][c]{5cm}{ {\begin{center} \includegraphics[width=.10\textwidth]{./Styles/Logo_Fresnel.eps}\end{center}} }
      & 
      \parbox[t][3cm][c]{5cm}{ {\begin{center} \includegraphics[width=.15\textwidth]{./Styles/Logo_U3.eps}\end{center}} }
      & 
      \parbox[t][3cm][c]{5cm}{ {\begin{center} \includegraphics[width=.17\textwidth]{./Styles/Logo_Egim.eps}\end{center}} }
       \\
      \parbox[t][1.5cm][c]{5cm}{Institut Fresnel}
      & 
      \parbox[t][1.5cm][c]{5cm}{\centering Université d'Aix-Marseille III} 
      & 
      \parbox[t][1.5cm][c]{5cm}{\centering \'Ecole Généraliste d'Ingénieurs de Marseille}
    \\
      \parbox[t][0.5cm][c]{5cm}{}
      & 
      
      & 
      
    \end{tabular}
    }}
\newcommand\DeaBefore[1]%
{\renewcommand{\@DeaBefore}{{\UseEntryFont{DeaBefore}#1}}}

                                % Auteur
\newcommand{\@DeaAuthor}%
{{\UseEntryFont{DeaAuthor}%
    \fbox{\'ecrire \tt\char`\\DeaAuthor\{ l'auteur \}}}}
\newcommand\DeaAuthor[1]%
{\renewcommand{\@DeaAuthor}{{\UseEntryFont{DeaAuthor}#1}}}


                                % Titre de la thèse
\newcommand{\@DeaTitle}%
{{\UseEntryFont{DeaTitle}\fbox{\tt\char`\\DeaTitle}\par}}
\newcommand\DeaTitle[1]%
{\renewcommand{\@DeaTitle}{\hrulefill\\{\UseEntryFont{DeaTitle}#1\par}\hrulefill\\}}

\newcommand\SetEntryFont[2]{\expandafter\def\csname @#1font\endcsname{#2}}
\newcommand\SetTBFont[7]{\expandafter\def\csname @#1font\endcsname
  {\TBusefont{#2}{#3}{#4}{#5}{#6}{#7}}}

\newcommand\UseEntryFont[1]{\csname @#1font\endcsname}
\newcommand{\TBusefont}[6]{\fontsize{#5}{#6}\usefont{#1}{#2}{#3}{#4}}
\newcommand{\TitlePageFontFamily}{cmr}
\newcommand{\TitlePageFontEncoding}{T1}
%{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{14}{15}%
\SetTBFont{DeaTitle}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{bx}{n}{20.74}{25}%
\SetTBFont{DeaKind}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{bx}{sc}{20.74}{25}%
\SetTBFont{DeaPresented}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{12}{14}%
\SetTBFont{DeaBefore}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{bx}{sc}{12}{14}%
\SetTBFont{DeaPresentedThe}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{14}{15}%
\SetTBFont{DeaPresentedBy}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{14}{15}%
\SetTBFont{DeaAuthor}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{bx}{n}{17.28}{20}
\SetTBFont{DeaJury}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{14}{15}%
\SetTBFont{DeaAffil}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{14}{15}%
\SetTBFont{DeaAffilSmall}%
{\TitlePageFontEncoding}{\TitlePageFontFamily}{m}{n}{12}{14}%

\newif\if@affiliation
\@affiliationfalse
\newtoks\@affil@tokI
\newtoks\@affil@tokII
\newcommand\@tokc@t[3]{%
  \edef\@tokconc@t{\the#1\the#2}%
  #3=\expandafter{\@tokconc@t}%
  }
\newtoks\@Dea@affil
\newcommand{\NewAffilCategory}[3]{%
  \expandafter\newtoks\csname#1\endcsname
  \csname#1\endcsname={}%
  \expandafter\def\csname#1@title\endcsname{{#2}{#3}}%
  \@affil@tokI=\expandafter{\csname#1\endcsname}%
  \@tokc@t\@Dea@affil\@affil@tokI\@Dea@affil
  \@affil@tokI=\expandafter{\csname#1@title\endcsname}%
  \@tokc@t\@Dea@affil\@affil@tokI\@Dea@affil
  }
\newcommand{\ClearAffil}{\@Dea@affil={}}
\ClearAffil
\NewAffilCategory{EquipeAccueil}{\'Equipe d'accueil~:}{\'Equipe d'accueil~:}
\NewAffilCategory{EquipesAccueil}{\'Equipes d'accueil~:}{\'Equipes d'accueil~:}
\NewAffilCategory{EcolesDoctorales}{\'Ecoles doctorales~:}{\'Ecoles doctorales~:}
\def\@selectiaffil#1{\expandafter\@@selectiaffil#1}
\def\@@selectiaffil#1#2{{#1}}
\def\@selectiiaffil#1{\expandafter\@@selectiiaffil#1}
\def\@@selectiiaffil#1#2{{#2}}
\newcommand\@buildaffil[1]{%
  \@affil@tokI={\bgroup\UseEntryFont{DeaAffil}\begin{tabular}{lll}}%
    \expandafter\@@buildaffil\the#1/%
    \@affil@tokII={\end{tabular}\egroup}%
  \@tokc@t\@affil@tokI\@affil@tokII\@affil@tokI
  \the\@affil@tokI
  }
\def\@@buildaffil#1#2#3/{%
  \def\@tmpa{#3}%
  \ifx\@tmpa\@empty
  \def\@tmpa{#1}%
  \ifx\@tmpa\@empty
  \else\@buildentryaffil#1#2%
  \fi
  \else
  \@buildentryaffil#1#2%
  \@@buildaffil#3/%
  \fi
  }
\newcommand\@buildentryaffil[2]{\expandafter\@buildtableaffil\the#1\\/#2}
\def\@buildtableaffil#1\\#2/#3{%
  \def\@tmpa{#1}%
  \ifx\@tmpa\@empty
  \else
  \@affiliationtrue %cette variable est utilisée pour supprimer un
                    % \vfill lorsqu'il n'y a pas d'affiliation de
                    % précisée
  \def\@tmpa{#2}%
  \ifx\@tmpa\@empty
  \@affil@tokII={\@selectiaffil#3&#1\\}%
  \@tokc@t\@affil@tokI\@affil@tokII\@affil@tokI
  \else
  \@affil@tokII={\@selectiiaffil#3&#1\\}%
  \@tokc@t\@affil@tokI\@affil@tokII\@affil@tokI
  \@@buildtableaffil#2/%
  \fi
  \@affil@tokII={[3mm]}%
  \@tokc@t\@affil@tokI\@affil@tokII\@affil@tokI
  \fi
  }
\def\@@buildtableaffil#1\\#2/{%
  \@affil@tokII={&#1\\}%
  \@tokc@t\@affil@tokI\@affil@tokII\@affil@tokI
  \def\@tmpa{#2}%
  \ifx\@tmpa\@empty
  \else\@@buildtableaffil#2/%
  \fi
  }

\newcommand\@DeaAffil{
  \UseEntryFont{DeaAffil}\fbox{utiliser \tt\char`\\DeaAffil\{Travail réalisé au sein...\}}
}
\newcommand\DeaAffil[1]%
{\@affiliationfalse \ClearAffil \renewcommand{\@DeaAffil}{{\UseEntryFont{DeaAffil}#1\par}}}

\newtoks\@jury@tokI
\newtoks\@jury@tokII
\newtoks\@Dea@jury
\newcommand{\NewJuryCategory}[3]{%
  \expandafter\newtoks\csname#1\endcsname
  \csname#1\endcsname={}%
  \expandafter\def\csname#1@title\endcsname{{#2}{#3}}%
  \@jury@tokI=\expandafter{\csname#1\endcsname}%
  \@tokc@t\@Dea@jury\@jury@tokI\@Dea@jury
  \@jury@tokI=\expandafter{\csname#1@title\endcsname}%
  \@tokc@t\@Dea@jury\@jury@tokI\@Dea@jury
  }
\newcommand{\ClearJury}{\@Dea@jury={}}
\ClearJury
\NewJuryCategory{President}{\textit{Pr\'esident :}}{\textit{Pr\'esidents :}}
\NewJuryCategory{Rapporteurs}{\textit{Rapporteur :}}{\textit{Rapporteurs :}}
\NewJuryCategory{Examinateurs}{\textit{Examinateur :}}{\textit{Examinateurs :}}
\NewJuryCategory{Invites}{\textit{Invit\'e :}}{\textit{Invit\'es :}}
\def\@selecti#1{\expandafter\@@selecti#1}
\def\@@selecti#1#2{{#1}}
\def\@selectii#1{\expandafter\@@selectii#1}
\def\@@selectii#1#2{{#2}}
\newcommand\@buildjury[1]{%
  \@jury@tokI={\bgroup\UseEntryFont{DeaJury}\begin{tabular}{lll}}%
    \expandafter\@@buildjury\the#1/%
    \@jury@tokII={\end{tabular}\egroup}%
  \@tokc@t\@jury@tokI\@jury@tokII\@jury@tokI
  \the\@jury@tokI
  }
\def\@@buildjury#1#2#3/{%
  \def\@tmpa{#3}%
  \ifx\@tmpa\@empty
  \def\@tmpa{#1}%
  \ifx\@tmpa\@empty
  \else\@buildentry#1#2%
  \fi
  \else
  \@buildentry#1#2%
  \@@buildjury#3/%
  \fi
  }
\newcommand\@buildentry[2]{\expandafter\@buildtable\the#1\\/#2}
\def\@buildtable#1\\#2/#3{%
  \def\@tmpa{#1}%
  \ifx\@tmpa\@empty
  \else
  \def\@tmpa{#2}%
  \ifx\@tmpa\@empty
  \@jury@tokII={\@selecti#3&#1\\}%
  \@tokc@t\@jury@tokI\@jury@tokII\@jury@tokI
  \else
  \@jury@tokII={\@selectii#3&#1\\}%
  \@tokc@t\@jury@tokI\@jury@tokII\@jury@tokI
  \@@buildtable#2/%
  \fi
  \@jury@tokII={[3mm]}%
  \@tokc@t\@jury@tokI\@jury@tokII\@jury@tokI
  \fi
  }
\def\@@buildtable#1\\#2/{%
  \@jury@tokII={&#1\\}%
  \@tokc@t\@jury@tokI\@jury@tokII\@jury@tokI
  \def\@tmpa{#2}%
  \ifx\@tmpa\@empty
  \else\@@buildtable#2/%
  \fi
  }
\newcommand\@DeaJury{\@buildjury\@Dea@jury}

\newlength\@bindingshift
\setlength\@bindingshift{0pt}
\newcommand\SetBinding[1]{%
  \setlength\@bindingshift{#1}%
  \divide\@bindingshift2\relax
  }
\newlength\@htitlepageshift
\newcommand{\@cover@hook}{}
\newenvironment{changemargin}[2]{\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{0pt}%
\setlength{\rightmargin}{0pt}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{0pt plus 1pt}%
\addtolength{\leftmargin}{#1}%
\addtolength{\rightmargin}{#2}%
}\item }{\end{list}}

\newcommand{\MakeDeaTitlePage}%
{%
  \newpage
  \@cover@hook
  \thispagestyle{empty}%
 \begin{changemargin}{-1.5cm}{-1cm}
    \@Dea@titlep@gebody
 \end{changemargin}
  \newpage
  \if@twoside
  \thispagestyle{empty}
  \hbox{}
  \par\vfill
  \newpage
  \addtocounter{page}{-2}%
  \else
  \addtocounter{page}{-1}%
  \fi
  \fontencoding{OT1}\normalfont\selectfont
  }%
\newcommand\@Dea@titlep@gebody{%
 %---------------------------------------------------
  \vspace*{-2cm}
  \begin{center}
    \@DeaBefore
    \vfill
    \@TitreStage
    \vfill
    \@DeaPresented
    \vfill
    \@DeaAuthor
    \vfill
  \end{center}
  \begin{center}
    \@DeaTitle
    \vfill
    \@DeaPresentedThe\\
    \vfill
    \@NomDEA
    \vfill
    \@NomStage
    \vfill
    %\@CompositionDuJury
    \@DeaJury
    \vfill\
    \hrulefill\\[0.2cm]
    \@DeaAffil
  \end{center}
 %---------------------------------------------------
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Defines Divers                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\fixme{{\bf FIXME:~}}
\def\cad  {\mbox{c'est-à-dire~}}
\def\cf   {cf.~}
\def\ie   {{\it i.e.~}}

%------ quelques commandes de formatage de pages / paragraphes ------
%\newcommand{\DS}[1]{\displaystyle{#1}}
%\newcommand{\bsloppy}{\begin{sloppypar}}
%\newcommand{\esloppy}{\end{sloppypar}}
%\newcommand{\msaut}{\vspace*{-0.1cm}}
%\newcommand{\gsaut}{\vspace*{1.cm}}
%\newcommand{\saut}{\vspace*{.5cm}}
%\newcommand{\psaut}{\vspace*{.2cm}}
%\newcommand{\ppsaut}{\vspace*{.1cm}}
%\newcommand{\malinea}{\hspace*{-2cm}}
%\newcommand{\alinea}{\hspace*{2cm}}
%\newcommand{\palinea}{\hspace*{1cm}}
%\newcommand{\ppalinea}{\hspace*{0.5cm}}
%\newcommand{\psalinea}{\hspace*{0.2cm}}
%\newcommand{\build}[3]{\mathrel{\mathop{\kern 0pt#1}\limits_{#2}^{#3}}}
%\newcommand{\Accolade}[1]{\left\{\begin{array}{l} #1 \end{array}\right. }
%\newcommand{\Entrepar}[1]{\left( \begin{array}{c}\hspace*{-0.2cm} #1
%\hspace*{-0.2cm}\end{array}\right) }
%\newcommand{\Entreacc}[1]{\left\{ \begin{array}{c}\hspace*{-0.2cm} #1
%      \hspace*{-0.2cm}\end{array}\right\} }

%-------------- quelques "shortcuts" pratiques ...  ----------------
% \renewcommand{\cf}{{\sl cf.~}}
%\newcommand{\cffig}[1]{(\cf~figure~\ref{#1})}
%\newcommand{\cfequ}[1]{(\cf~quation~\eqref{#1})}
%\newcommand{\cfpar}[1]{(\cf~paragraphe~\ref{#1})}
%\newcommand{\etc}{{etc.}}

%--------- pour les citations ( la place de \citation) ------------
%\newcommand{\citat}[2]{
%\begin{tabular}{p{5.5cm}p{9cm}}
% & \og {\small  {\sl #1}} \fg\\
% &\vspace*{0.5mm} {\scriptsize #2}
%\end{tabular} }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  PAGE LAYOUT                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\topmargin 0mm
\headheight 10mm
\headsep 10mm
\footskip 10mm
\columnsep 6mm
\columnseprule 0pt

\sloppy
\parindent 2.5em
\leftmargini 2em
\leftmargin\leftmargini
\leftmarginv .5em
\leftmarginvi .5em


\if@twoside
\setlength{\oddsidemargin}{0.55cm}
\setlength{\evensidemargin}{0cm}
\else
\oddsidemargin  0.5cm
\evensidemargin 0.5cm
\fi

\marginparwidth 1.5cm   %   Width of marginal notes.
\textwidth      15.5cm
%\voffset        -1.0cm  % Decalage vertical vers le haut
\voffset        0cm  % Decalage vertical vers le haut
\textheight     22.5cm


% on détermine le nombre de flottants autorisés par page,
\setcounter{totalnumber}{6}
\renewcommand{\floatpagefraction}{.7}
\renewcommand{\topfraction}{1.0}
\renewcommand{\bottomfraction}{1.0}
\renewcommand{\textfraction}{0.00}


\setlength{\parindent}{0.6cm} % indent au debut d'un paragraph
\setlength{\parskip}{1.5mm}   % distance entre paragraphes

% \RequirePackage{epsfig}
\if@draft
% \psfull % pour garder les images quand meme
\def\baselinestretch{1.62} %% double interligne en 11pt
\else
\def\baselinestretch{1.0}
\fi


% The `\flushbottom' declaration makes all text pages the same height,
% adding extra vertical space when necessary to fill out the page.
%    This is the standard if twocolumn mode is selected.
\flushbottom

% on commence en chiffres romains jusqu'a \mainmatter
\pagenumbering{roman}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Style french                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[francais]{babel}
\frenchspacing
%\RequirePackage[T1]{fontenc} %Pour obtenir une cesure correcte des mots accentués

\def\acknowledgmentsname{Remerciements}
\def\introductionname{Introduction}
\def\conclusionname{Conclusion}
\def\myabstractname{Abstract}
\def\resumename{Résumé}
\addto\captionsfrenchb{\def\pagename{page}}
\addto\captionsfrenchb{\def\refname{R\'ef\'erences}}
\addto\captionsfrenchb{\def\bibname{Bibliographie}}
\addto\captionsfrenchb{\def\listfigurename{Liste des figures}}
\addto\captionsfrenchb{\def\listtablename{Liste des tableaux}}
\addto\captionsfrenchb{\def\indexname{Index}}
\addto\captionsfrenchb{\def\seename{\emph{voir}}}
\addto\captionsfrenchb{\def\seealsoname{\emph{voir aussi}}}
\addto\captionsfrenchb{\def\figurename{Figure}}
\addto\captionsfrenchb{\def\tablename{Tableau}}
\addto\captionsfrenchb{\def\partname{\protect\@RPt partie}}
\addto\captionsfrenchb{\def\@RPt{{\ifcase\value{part}\or Premi\`ere\or Deuxi\`eme\or
      Troisi\`eme\or Quatri\`eme\or Cinqui\`eme\or Sixi\`eme\or
      Septi\`eme\or Huiti\`eme\or Neuvi\`eme\or Dixi\`eme\or
      Onzi\`eme\or Douzi\`eme\or Treizi\`eme\or Quatorzi\`eme\or
      Quinzi\`eme\or Seizi\`eme\or Dix-septi\`eme\or
      Dix-huiti\`eme\or Dix-neuvi\`eme\or Vingti\`eme\fi}\space\def\thepart{}}}
\addto\captionsfrenchb{\def\glossaryname{Glossaire}}
\addto\captionsfrenchb{\def\chaptername{Chapitre}}
\addto\captionsfrenchb{\def\appendixname{Annexe}}
\addto\captionsfrenchb{\def\appendixtitle{Annexe du chapitre}}
\ifx\ier\undefined\def\ier{er}\fi
\addto\captionsfrenchb{\def\today{\ifnum\day=1\relax 1\ier
    \else \number\day\fi
    \space\ifcase\month\or janvier\or f\'evrier\or mars\or
    avril\or mai\or juin\or juillet\or ao\^ut\or septembre\or
    octobre\or novembre\or d\'ecembre\fi \space\number\year}}

%\renewcommand\abstractname{R\'esum\'e}
\def\note#1{\footnote{---~#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FancyHeadings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{./Styles/fancyheadings}
\pagestyle{fancyplain}

%%% On définit les marqueurs de haut de page...
\chead{}
%%% Dans le mode oneside on affiche les references du chapitre en haut
\newlength\lheadtitle
\newlength\lpagenumber
\settowidth{\lpagenumber}{\thepage}
\addtolength{\lpagenumber}{2em}

\if@twoside
\rhead[\fancyplain{}{\hspace{\lpagenumber}\slshape \leftmark}]{\fancyplain{}{\thepage}}
\lhead[\fancyplain{}{\thepage}]{\fancyplain{}%
  {\slshape \rightmark\hspace{\lpagenumber}}}
\else
\lhead{\fancyplain{}{\leftmark\hspace{\lpagenumber}}}
\rhead{\fancyplain{}{\thepage}}
% \rhead[\fancyplain{}{\slshape \rightmark}]{\fancyplain{}{~\thepage}}
\fi

%%% ... et les marqueurs de bas de page
\cfoot{}
\rfoot{}
\lfoot{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Chapitre                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\cleardoublepage{%
% On desire, dans le cas du recto-verso, si la page de
% gauche n'a pas de texte, d'enlever le style
% (le haut et le bas de la page)
\clearpage
\if@twoside
  \ifodd\c@page
  \else
    \hbox{}\thispagestyle{empty}\newpage
  \fi
\fi
}


\if@style@chapLargeNum
  \RequirePackage{./Styles/fancyheadings}
  \RequirePackage{ifthen}
  \renewcommand\chaptername{chapitre}
  \newfont{\chapfonte}{cmr10 scaled 9000}
                                % La taille (=hauteur) de la fonte est 10pt * scaled / 1000
                                % Remarque : \magstep<n> vaut 1000*(1.2)^n
                                % Donc \magstep1 multiplie la fonte par 1.2, ie l'augmente de 20%

  \def\haut{20mm}         % Hauteur des chiffres, à ajuster avec 'scaled'
  \def\decal{1.75ex}      % Pour aligner la ligne avec le haut de CHAPITRE

  \newlength{\lgnamechap}
  \newlength{\lgnumchap}
  \newlength{\lgall}

  \def\@makechapterhead#1{%
    %\thispagestyle{empty}% pas de numéro de page
    \def\myboxtwo{\mbox{\chapfonte\thechapter}}

    %
    % pour myboxone (style de chapitre (annexe ou these)) impossible
    % d'utiliser la macro \@chapapp !!! ne fonctionne pas dans le
    % \Large\sf\uppercase\expandafter{\@chapapp} !!!
    %

    \ifthenelse{\equal{\@chapapp}{\chaptername}}%
    {\def\myboxone{\Large\sf\uppercase\expandafter{\chaptername}}}%
    {\def\myboxone{\Large\sf\uppercase\expandafter{\appendixname}}}

%     \def\myboxone{\Large\sf\uppercase\expandafter{\chaptername}}\else
%     \def\myboxone{\Large\sf\uppercase\expandafter{\appendixname}}\fi

    \settowidth{\lgnamechap}{\myboxone}
    \settowidth{\lgnumchap}{\myboxtwo}
    \addtolength{\lgnumchap}{6mm}
    \setlength{\lgall}{\textwidth}
    \addtolength{\lgall}{-\lgnamechap}
    \addtolength{\lgall}{-\lgnumchap}
    \addtolength{\lgall}{-5pt}
    {\parindent\z@
      \parbox[t]{\lgnamechap}{\myboxone}
      \raisebox{\decal}{%
        \raisebox{-\haut}{\parbox[t]{\lgnumchap}{\hspace{2mm}\myboxtwo}}}
      \raisebox{\decal}{\parbox[t]{\lgall}{\rule{\lgall}{1mm}
          \begin{flushleft}
            \Huge\bf{#1}
          \end{flushleft}
          }}
      \par
      \nobreak
      \vskip 100\p@
      }
    }

\def\@makeschapterhead#1{%
  % \thispagestyle{empty}% pas de numéro de page
  \def\myboxtwo{\mbox{\chapfonte 1}}
  \def\myboxone{\Large\sf\uppercase\expandafter{chapitre}}
  \settowidth{\lgnamechap}{\myboxone}
  \settowidth{\lgnumchap}{\myboxtwo}
  \addtolength{\lgnumchap}{6mm}
  \setlength{\lgall}{\textwidth}
  \addtolength{\lgall}{-\lgnamechap}
  \addtolength{\lgall}{-\lgnumchap}
  \addtolength{\lgall}{-5pt}
  {
    \typeout{----------> }
    \typeout{----------> \@chapapp\space #1.}
    \typeout{----------> }
    \parindent\z@
    \parbox[t]{\lgnamechap}{\hspace{\lgnamechap}}
    \raisebox{\decal}{%
      \raisebox{-\haut}{\parbox[t]{\lgnumchap}{\hspace{2mm}\hspace{\lgnumchap}}}}
    \raisebox{\decal}{\parbox[t]{\lgall}{\rule{\lgall}{1mm}
        \begin{flushleft}
          \Huge\bf{#1}
        \end{flushleft}
        }}
    \par
    \nobreak
    \vskip 100\p@
    }
   \def\myname{#1}
   \def\mymajname{\MakeUppercase{\myname}}
   \markboth{\mymajname}{\mymajname}
%   \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}
%   \chaptermark{#1}
  }

\fi % fin de la definition du style ChapitreLargeNum (Style1)

\if@style@chapOrdinal
%   \renewcommand{\ps@plain}{%
%     \renewcommand{\@evenhead}{}%
%     \renewcommand{\@oddhead}{}%
%     \renewcommand{\@evenfoot}{\hfill\textrm{\thepage}\hfill}%}
%     \renewcommand{\@oddfoot}{\@evenfoot}}

  \def\@Fch{{\ifcase\value{chapter}\or Premier\or Deuxi\`eme\or
      Troisi\`eme\or Quatri\`eme\or Cinqui\`eme\or Sixi\`eme\or
      Septi\`eme\or Huiti\`eme\or Neuvi\`eme\or Dixi\`eme\or Onzi\`eme\or
      Douzi\`eme\or Treizi\`eme\or Quatorzi\`eme\or Quinzi\`eme\or
      Seizi\`eme\or Dix-septi\`eme\or Dix-huiti\`eme\or Dix-neuvi\`eme\or
      Vingti\`eme\fi}\space\def\thechapter{}}


  \def\@makechapterhead#1{             % Heading for \chapter command
    \thispagestyle{empty}
                                % \vspace*{50pt}                     % Space at top of text page.
    { \parindent 0pt \raggedright
      \ifnum \c@secnumdepth >\m@ne     % IF secnumdepth > -1 THEN
                                %\large\bf \@chapapp{} \thechapter % Print 'Chapter' and number.
      \LARGE\bf \protect\@Fch\space \chaptername
      \typeout{----------> \@chapapp\space #1.}
      \par
      \vskip 30pt \fi                  % Space between number and title.

      \hspace*{5mm}
      \parbox{150mm}{
        \begin{flushleft}

          \Huge \bf                        % Title in parbox (left aligned)
          #1\par

        \end{flushleft} }

      \nobreak                         % TeX penalty to prevent page break.
      \vskip 120pt                      % Space between title and text.
      }
    }
\fi % fin de la definition du style ChapitreOrdinal (ChapStyle2)

\if@style@chapDefault
\fi % fin de la definition du style ChapitreNormal (ChapStyle0)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caption %%% ATTENTION CE N'est PAS forcement supporté par toutes les
% distrib LateX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{caption2}
%\captionstyle{centerlast}
\renewcommand\captionfont
{\footnotesize}
\renewcommand\captionlabelfont{\bfseries\itshape}
%\setcaptionmargin{\leftmargini}
%\setlength\captionindent{\parindent}
\renewcommand\captionlabeldelim{~---}
\onelinecaptionstrue
%\setcaptionwidth{12.9999cm}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% varioref
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{varioref}

\def\reftextfaceafter {\`a la page \reftextvario{ci-contre}{suivante}}
\def\reftextfacebefore{\`a la page \reftextvario{pr\'ec\'edente}{ci-contre}}
\def\reftextafter     {\`a la page suivante}
\def\reftextbefore    {\`a la page pr\'ec\'edente}
\def\reftextcurrent   {de la pr\'esente page}
\def\reftextfaraway#1{page~\pageref{#1}}

\vrefwarning


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARstart (comme dans le style IEEE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\PARstart#1#2{\begingroup\def\par{\endgraf\endgroup\lineskiplimit=0pt}
    \setbox2=\hbox{\lowercase{#2} }\newdimen\tmpht \tmpht \ht2
    \advance\tmpht by \baselineskip\font\hhuge=cmr10 at \tmpht
    \setbox1=\hbox{{\hhuge #1}}
    \count7=\tmpht \count8=\ht1\divide\count8 by 1000 \divide\count7 by\count8
    \tmpht=.002\tmpht\multiply\tmpht by \count7\font\hhuge=cmr10 at \tmpht
    \setbox1=\hbox{{\hhuge #1}} \noindent \hangindent1.05\wd1
    \hangafter=-3 {\hskip-\hangindent \lower1\ht1\hbox{\raise2.0\ht2\copy1}%
    \kern-0\wd1}\copy2\lineskiplimit=-1000pt}

\if@draft\def\PARstart#1#2{#1#2}\fi % if draft, disable it





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Remerciements, Résumé, Abstract, Intro, Conclu, Biblio %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\Remerciements}[1]{%
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
}
\newcommand{\Introduction}[1]{%
  \chapter*{#1}
  \addcontentsline{toc}{chapter}{#1}
}
\newcommand{\Conclusion}[1]{%
  \chapter*{#1}
  \addcontentsline{toc}{chapter}{#1}
}
\newcommand{\Abstract}[1]{%
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
}
\newcommand{\Resume}[1]{%
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
}
\newcommand{\Notations}[1]{%
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
}
\newcommand{\Abreviations}[1]{%
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
}
\newcommand{\ListeFigures}[1]{%
  \cleardoublepage
  \addcontentsline{toc}{chapter}{#1}
  \listoffigures
}
\newcommand{\ListeTables}[1]{%
  \cleardoublepage
  \addcontentsline{toc}{chapter}{#1}
  \listoftables
}
\newcommand{\Bibliographie}[1]{%
  \cleardoublepage
  \addcontentsline{toc}{chapter}{\bibname}
  \bibliography{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  ChapterAbstract                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@chapterabstract@hook}{}
\newenvironment{ChapterAbstract}%
{%
  \@chapterabstract@hook
  \vspace*{\stretch{1}}
  }
{%
  \vspace*{\stretch{2}}
  \newpage
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  DeaDedication                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@dedication@hook}{}
\newenvironment{DeaDedication}{%
  \cleardoublepage
  \@dedication@hook
  \@mkboth{}{}
  \thispagestyle{plain}
  \vglue0pt plus.5fil
  \fontfamily{\sfdefault}\fontseries{m}\fontshape{sl}\selectfont
  \begin{flushright}
    }%
  {%
  \end{flushright}
  \vglue0pt plus1fil\cleardoublepage
  }
\endinput
