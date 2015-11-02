":let g:EasyMotion_do_mapping=0
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" clang complate: c++ auto completion
Plugin 'Rip-Rip/clang_complete.git'

" command-t: fuzzy file finder
Plugin 'wincent/Command-T'

" ultisnips: shortcut text generation
Plugin 'SirVer/ultisnips'

" ultisnips snippets: predefined snippets
Plugin 'honza/vim-snippets'

" easymotion: moving around fast
Plugin 'easymotion/vim-easymotion'
"
" amber language: amber language support
Plugin 'burner/amber.vim'

" editorconfig: editor config files configure vim to a specific project
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

set runtimepath+=~/.vim/mysnippets

:syntax on
:set encoding=utf-8
:set number
:set ts=4

:map j <LEFT>
:map k <UP>
:map l <DOWN>
:map ö <RIGHT>

:map <c-k> gT
:map <c-l> gt

:nnoremap <C-s> :w<CR>
:nnoremap <C-n> :w<CR> :!make<CR>
:vnoremap <C-s> <C-c>:w<CR>
:inoremap <C-s> <C-o>:w<CR><ESC>

:map <F5> <ESC>diwi\emph{<ESC>pi<Right>}<ESC>
:map <F6> <ESC>diwi\textbf{<ESC>pi<Right>}<ESC>
:map <F3> <ESC>diwi\textsc{<ESC>pi<Right>}<ESC>

:if !empty(glob("~/Source/writecorret/writecorrect.vim"))
	:source ~/Source/writecorret/writecorrect.vim
:endif
:map <F8> :call WriteCorrect("speech")<CR>
:map <F9> :call WriteCorrect("check")<CR>

" Ctrl-s saves the current file
:map <c-s> :w<CR>

:set incsearch
:set tw=78

:set fo+=t

:let g:tex_flavor='latex'

" Complete options (disable preview scratch window)
:set completeopt=menu,menuone,longest
" Limit popup menu height
:set pumheight=15

" Clang Complete Settings
"let g:clang_use_library=1
" if there's an error, allow us to see it
let g:clang_complete_auto=0
let g:clang_complete_copen=1
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=0
" Limit memory use
"let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options=' -std=c++11 -I/home/burner/Source/sweet.hpp -I. -I./include -I./includes || exit 0'
"let g:clang_user_options='|| exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
"let g:clang_auto_select=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

autocmd FileType tex let loaded_matchparen = 0
let g:tex_flavor='latex'
autocmd FileType cpp set cindent
autocmd FileType d set cindent
autocmd FileType java set cindent
autocmd FileType cpp set shiftwidth=4
autocmd FileType d set shiftwidth=4
autocmd FileType tex set shiftwidth=4
autocmd FileType java set shiftwidth=4

autocmd FileType tex set spell
autocmd FileType tex set spelllang=de,en
autocmd FileType tex set nojoinspaces

if filereadable(glob("~/DotFiles/vimabbrv")) 
    source ~/DotFiles/vimabbrv
endif

"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview
"
let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd']
let g:dutyl_neverAddClosingParen=1

set conceallevel=0

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

set foldmethod=manual
set matchpairs+=<:> 

" UlitSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltniSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-p>"

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionShade  Comment

nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

autocmd FileType dt set filetype=jade

" Auto closing character
autocmd FileType javascript,c,scad,cpp,hpp,d inoremap {<CR> {<CR>}<Esc><S-o>

:nmap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nmap S :exec "normal a".nr2char(getchar())."\e"<CR>

autocmd FileType am set autoindent
autocmd BufNewFile,BufRead *.am setfiletype amber
autocmd! Syntax amber source $VIM/amber.vim

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
