call pathogen#infect()

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

:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

:nnoremap <C-s> :w<CR>
:nnoremap <C-n> :w<CR> :!make<CR>
:vnoremap <C-s> <C-c>:w<CR>
:inoremap <C-s> <C-o>:w<CR><ESC>

:map <F5> <ESC>diwi\emph{<ESC>pi<Right>}<ESC>
:map <F6> <ESC>diwi\textbf{<ESC>pi<Right>}<ESC>
:map <F3> <ESC>diwi\textsc{<ESC>pi<Right>}<ESC>

:map <c-s> :w<CR>

:set incsearch
:set tw=78

:set fo+=t

" Complete options (disable preview scratch window)
:set completeopt=menu,menuone,longest
" Limit popup menu height
:set pumheight=15

" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType = "context"

" Clang Complete Settings
let g:clang_use_library=1
" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options=' -std=c++11 -I/home/burner/sweet.hpp -I. -I./include -I./includes || exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
let g:clang_auto_select=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'


autocmd FileType tex let loaded_matchparen = 0
autocmd FileType cpp set cindent
autocmd FileType d set cindent
autocmd FileType cpp set shiftwidth=4
autocmd FileType d set shiftwidth=4
autocmd FileType tex set shiftwidth=4

autocmd FileType tex set spell
autocmd FileType tex set spelllang=de,en
autocmd FileType tex set nojoinspaces

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

set runtimepath+=~/.vim/ultisnips_rep,~/Source/DCD/editors/vim/autoload,~/Source/DCD/editors/vim/ftplugin
let g:dcd_importPath=['/usr/include/dlang/dmd','/usr/include/dlang/dmd/core','/usr/include/dlang/dmd/etc','/usr/include/dlang/dmd/std']

filetype plugin on
set omnifunc=dcomplete#Complete

set conceallevel=0

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

set foldmethod=manual
set matchpairs+=<:> 

" UlitSnips
let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-ö>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
