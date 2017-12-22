call plug#begin('~/.config/nvim/plugged')
" Easymotion
Plug 'easymotion/vim-easymotion'

" ultisnips: shortcut text generation
Plug 'SirVer/ultisnips'

" ultisnips snippets: predefined snippets
Plug 'honza/vim-snippets'

" fuzzy file finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" completion
Plug 'Shougo/deoplete.nvim'

" completion:c++
Plug 'zchee/deoplete-clang', { 'for' : 'cpp' }

" completion:dlang
Plug 'landaire/deoplete-d'

" completion:typescript
Plug 'mhartington/deoplete-typescript', { 'do': 'npm install typescript', 'for': 'typescript' }

" Editor config support
Plug 'editorconfig/editorconfig-vim'

" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

call plug#end()


set laststatus=0

filetype plugin indent on
:syntax on
:set termguicolors
:set number

:set encoding=utf-8
:set number
:set ts=4
:set shiftwidth=4

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

" Latex options
autocmd FileType tex set spell
autocmd FileType tex set spelllang=de,en_us
autocmd FileType tex syntax spell toplevel
autocmd FileType tex set nojoinspaces
autocmd FileType tex setl noai nocin nosi inde=

:set mouse=a

" Fuzzy File Finder
:map <leader>t :FZF<CR>

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionShade  Comment

:nmap h <Plug>(easymotion-prefix)

" completion
let g:deoplete#enable_at_startup = 1
"let g:deoplete#complete_method = "complete"
let g:deoplete#disable_auto_complete = 1
inoremap <expr> <C-n>  deoplete#mappings#manual_complete()
set completeopt-=preview

" completion:c++
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#std#cpp = 'c++14'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#flags = [ "--std=c++14" ]

" completion:dlang
let g:deoplete#sources#d#dcd_server_autostart = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-u>"
let g:UltiSnipsListSnippets="<c-s-p>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
