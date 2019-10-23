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

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'd-language-server/vscode-dlang' , {'do': 'yarn install --frozen-lockfile'}

"" Typescript syntax
Plug 'leafgarland/typescript-vim'

"" completion:typescript
Plug 'HerringtonDarkholme/yats.vim'

"" completion:dlang
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'monkoose/deoplete-d', { 'for' : 'd' }

" syntax:pug,jade,diet
Plug 'digitaltoad/vim-pug'

" svelte
Plug 'burner/vim-svelte'

" Editor config support
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'

" Vue
Plug 'posva/vim-vue'

" Elm
Plug 'elmcast/elm-vim'

" Svelte
Plug 'burner/vim-svelte'

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

" Move tabs
:nnoremap <A-j> :tabm -1<cr>
:nnoremap <A-ö> :tabm +1<cr>

" Go to next/previous tab
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

"
" COC
"

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"
" COC END
"

" completion
"let g:deoplete#enable_at_startup = 1
""let g:deoplete#complete_method = "complete"
"let g:deoplete#disable_auto_complete = 1
"inoremap <expr> <C-n> deoplete#manual_complete()
"
"set completeopt-=preview
"
"" completion:c++
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#std#cpp = 'c++14'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"let g:deoplete#sources#clang#flags = [ "--std=c++14" ]
"
"" completion:dlang
"let g:deoplete#sources#d#dcd_client_binary = '/usr/bin/dcd-client'
"let g:deoplete#sources#d#dcd_server_binary = '/usr/bin/dcd-server'
"let g:deoplete#sources#d#dcd_server_autostart = 1
"let g:deoplete#sources#d#load_dub = 1

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

" Fix highlighting
let c_minlines=500
