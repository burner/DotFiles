call plug#begin('~/.config/nvim/plugged')
" Easymotion
Plug 'easymotion/vim-easymotion'

" ultisnips: shortcut text generation
Plug 'SirVer/ultisnips'

" ultisnips snippets: predefined snippets
Plug 'honza/vim-snippets'

" fuzzy file finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" ctrlp smarttab
Plug 'DavidEGx/ctrlp-smarttabs'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" completion:c++
Plug 'zchee/deoplete-clang', { 'for' : 'cpp' }

" Typescript syntax
Plug 'leafgarland/typescript-vim'

" completion:typescript
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" completion:dlang
"Plug 'landaire/deoplete-d'
Plug 'monkoose/deoplete-d', { 'for' : 'd' }

" syntax:pug,jade,diet
Plug 'digitaltoad/vim-pug'

" Editor config support
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'

" Vue
Plug 'posva/vim-vue'

" Elm
Plug 'elmcast/elm-vim'

call plug#end()

colorscheme evening
set laststatus=0

filetype plugin indent on
:syntax on
:set termguicolors
:set number
:set nohlsearch

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

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Latex options
autocmd FileType tex set spell
autocmd FileType tex set spelllang=de,en_us
autocmd FileType tex syntax spell toplevel
autocmd FileType tex set nojoinspaces
autocmd FileType tex setl noai nocin nosi inde=

" dpp options
autocmd BufReadPost *.dpp set syntax=d

" diet options
autocmd BufReadPost *.dt set syntax=pug

:set mouse=a

" Fuzzy File Finder
:map <leader>t :FZF<CR>

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionShade  Comment

:nmap h <Plug>(easymotion-prefix)
:nmap <Leader>l <Plug>(easymotion-j)
:nmap <Leader>k <Plug>(easymotion-k)

" completion
let g:deoplete#enable_at_startup = 1
"let g:deoplete#complete_method = "complete"
let g:deoplete#disable_auto_complete = 1
inoremap <expr> <C-n> deoplete#mappings#manual_complete()

set completeopt-=preview

" completion:c++
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#std#cpp = 'c++14'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#flags = [ "--std=c++14" ]

" completion:dlang
let g:deoplete#sources#d#dcd_client_binary = '/usr/bin/dcd-client'
let g:deoplete#sources#d#dcd_server_binary = '/usr/bin/dcd-server'
let g:deoplete#sources#d#dcd_server_autostart = 1
let g:deoplete#sources#d#load_dub = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-s-p>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Clipboard
set clipboard+=unnamedplus

" Multiline Searching
" Search for the ... arguments separated with whitespace (if no '!'),
" or with non-word characters (if '!' added to command).
function! SearchMultiLine(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>

function! LazyP()
  let g:ctrlp_default_input = expand('<cword>')
  CtrlPTag
  let g:ctrlp_default_input = ''
endfunction
command! LazyP call LazyP()
nnoremap <C-h> :call LazyP()<CR>
nnoremap <leader>p :call LazyP()<CR>

:source ~/DotFiles/nvim/gentags.vim
:map <F7> :call GenTags()<CR>

" Diff options
set diffopt+=vertical

" Smart tab
let g:ctrlp_extensions = ['smarttabs']
nnoremap <leader>b :CtrlPSmartTabs<CR>
let g:ctrlp_smarttabs_modify_tabline = 0
let g:ctrlp_smarttabs_reverse = 0
let g:ctrlp_smarttabs_exclude_quickfix = 0
