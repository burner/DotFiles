:syntax on
:set termguicolors
:set number

:set encoding=utf-8
:set number
:set ts=4

:map j <LEFT>
:map k <UP>
:map l <DOWN>
:map ö <RIGHT>

:nnoremap <S-k> :tabm -1<cr>
:nnoremap <S-l> :tabm +1<cr>
:map <c-k> gT
:map <c-l> gt


:nnoremap <C-s> :w<CR>
:nnoremap <C-n> :w<CR> :!make<CR>
:vnoremap <C-s> <C-c>:w<CR>
:inoremap <C-s> <C-o>:w<CR><ESC>

:set incsearch
:set tw=78

:set fo+=t

:let g:tex_flavor='latex'

:nmap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nmap S :exec "normal a".nr2char(getchar())."\e"<CR>

:set mouse=a
