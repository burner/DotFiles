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
:vnoremap <C-s> <C-c>:w<CR>
:inoremap <C-s> <C-o>:w<CR><ESC>

:map <F5> <ESC>diwi\emph{<ESC>pi<Right>}<ESC>
:map <F6> <ESC>diwi\textbf{<ESC>pi<Right>}<ESC>
:map <F3> <ESC>diwi\textsc{<ESC>pi<Right>}<ESC>

:map <c-s> :w<CR>

:set incsearch
:set textwidth=78

autocmd FileType tex let loaded_matchparen = 0
autocmd FileType cpp set cindent
autocmd FileType d set cindent
autocmd FileType cpp set shiftwidth=4
autocmd FileType d set shiftwidth=4
autocmd FileType tex set shiftwidth=4

autocmd FileType tex set spell
autocmd FileType tex set spelllang=de,en
autocmd FileType tex set nojoinspaces

"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

filetype plugin on
set ofu=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menu

function! UpdateTags()
  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()

set runtimepath+=~/.vim/ultisnips_rep

let g:UltiSnipsExpandTrigger="<C-p>"
let g:UltiSnipsListSnippets="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-p>"
let g:UltiSnipsJumpBackwardTrigger="<C-o>"
