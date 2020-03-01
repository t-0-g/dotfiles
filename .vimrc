
set number
set tabstop=2
set shiftwidth=2
set autoindent
set cursorline
set laststatus=2
set wildmode=list:longest
set noswapfile
set nobackup
set showcmd
set smartindent
set showmatch
set ignorecase
set hlsearch
set belloff=all
set backspace=indent,eol,start
set expandtab

" UK配列は：がうちにくい
nnoremap ; :

syntax on 
colorscheme molokai
set t_Co=256 

" Esc二回でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set guioptions-=T


"packages --------------------------------------------------------------------
if 0 | endif
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"---------------------------------

"neobundle 

NeoBundle 'simeji/winresizer' 

"非同期処理
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'mac' : 'make',
\    },
\ }

"オートコンプリート
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif
" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

" 括弧の補完
NeoBundle 'Townk/vim-autoclose'
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

" JavaScript用のカラープラグイン１
NeoBundle 'pangloss/vim-javascript'

" Vimshellを開く
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

" vimshell {{{
nmap <silent> vsh :<C-u>VimShell<CR>

" NERDTree
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'fatih/vim-go'

NeoBundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1

" vue
NeoBundle 'posva/vim-vue'

" memolist
NeoBundle 'glidenote/memolist.vim'
nnoremap <leader>mn  :MemoNew<CR>
nnoremap <leader>ml  :MemoList<CR>
nnoremap <leader>mg  :MemoGrep<CR>
let g:memolist_path = "~/workspace/memo"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = "~/.vim/template/memolist"

" previm
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
nnoremap <leader>pv  :PrevimOpen<CR>
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:vim_markdown_folding_disabled = 1

" vim-commentary
NeoBundle 'tpope/vim-commentary'

" vim-ariline
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


"-------------------------------
call neobundle#end()
" Required:
filetype plugin indent on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


