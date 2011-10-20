" Vim color file
" Maintainer:	Dave Turner <turner@ameslab.gov>
" Last Change:	2005 June 2
" modified from the darkblue.vim file of Bohdan Vlasyuk

" NightShade -- My colorizations on a dark background
" NightShade_Print -- Colors to use to print with
" map <F1> :colorscheme nightshade_print<CR> :hardcopy<CR> :colorscheme nightshade<CR>


set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "garry"

hi Normal		guifg=#e0e0e0 guibg=#000000
hi ErrorMsg		guifg=#ffffff guibg=#287eff
hi Visual		guifg=#8080ff guibg=fg		gui=reverse
hi VisualNOS	guifg=#8080ff guibg=fg		gui=reverse,underline
hi Todo			guifg=#d14a14 guibg=#1248d1
hi Search		guifg=#90fff0 guibg=#2050d0
hi IncSearch	guifg=#b0ffff guibg=#2050d0

hi SpecialKey		guifg=cyan
hi Directory		guifg=cyan
hi Title			guifg=magenta gui=none
hi WarningMsg		guifg=red
hi WildMenu			guifg=yellow guibg=black
hi ModeMsg			guifg=#22cce2
hi MoreMsg			ctermfg=darkgreen	ctermfg=darkgreen
hi Question			guifg=green gui=none
hi NonText			guifg=#0030ff

hi StatusLine		guifg=blue guibg=darkgray gui=none
hi StatusLineNC		guifg=black guibg=darkgray gui=none
hi VertSplit		guifg=black guibg=darkgray gui=none

hi Folded			guifg=#808080 guibg=#000040
hi FoldColumn		guifg=#808080 guibg=#000040
hi LineNr			guifg=#90f020

hi DiffAdd			guibg=darkblue
hi DiffChange		guibg=darkmagenta
hi DiffDelete		ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText			cterm=bold

hi Cursor			guifg=#000020 guibg=#ffaf38
hi lCursor			guifg=#ffffff guibg=#000000

hi Comment	guifg=yellow guibg=#000050
"hi Constant	guifg=#ff58b3 gui=bold
hi Constant	guifg=green4 gui=none
hi String	guifg=#ff3030 gui=none
hi Special	guifg=Orange gui=none
hi Identifier	guifg=#ffafe8 gui=bold
" hi Statement	guifg=yellow3 gui=bold
" hi Statement	gui=bold guifg=#0030ff
hi Statement	gui=bold guifg=SeaGreen
hi Type gui=bold guifg=yellow
" hi PreProc	guifg=green1 gui=bold
hi PreProc	guifg=#60cc60 gui=none
hi Label        guifg=cyan
hi Operator     guifg=yellow    gui=none
hi Number       guifg=#ff58b3 gui=bold
hi Function     guifg=cyan gui=none
"light purple
"hi Function     guifg=#c0c0ff gui=none

hi IO		guifg=red gui=bold
hi Communicator		guibg=yellow2 guifg=black gui=bold
hi UnitHeader	guibg=cyan guifg=black gui=bold
" hi Macro        guibg=green
hi Keyword      guifg=red

hi Underlined	cterm=underline term=underline
hi Ignore	guifg=bg

hi Tooltip	guibg=red

hi TabLine guifg=yellow guibg=darkgrey ctermfg=yellow ctermbg=darkgrey
hi TabLineSel guifg=white ctermfg=white

hi statusline guibg=blue guifg=yellow gui=bold
hi User1 guibg=darkblue guifg=yellow
hi User2 guibg=darkblue guifg=lightblue
hi User3 guibg=darkblue guifg=red
hi User4 guibg=darkblue guifg=cyan
hi User5 guibg=darkblue guifg=lightgreen

set statusline=%<%1*===\ %5*%f%1*%(\ ===\ %4*%h%1*%)%(\ ===\ %4*%m%1*%)%(\ ===\ %4*%r%1*%)\ ===%====\ %2*%b(0x%B)%1*\ ===\ %3*%l,%c%V%1*\ ===\ %5*%P%1*\ ===%0* laststatus=2
