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

"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 0 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

filetype plugin on
"set ofu=syntaxcomplete#Complete
"set completeopt-=preview
"set completeopt+=menu

"function! UpdateTags()
"  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
"  echohl StatusLine | echo "C/C++ tag updated" | echohl None
"endfunction
"nnoremap <F4> :call UpdateTags()

set runtimepath+=~/.vim/ultisnips_rep

let g:UltiSnipsExpandTrigger="<C-p>"
let g:UltiSnipsListSnippets="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-p>"
let g:UltiSnipsJumpBackwardTrigger="<C-o>"
