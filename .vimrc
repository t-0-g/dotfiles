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
set clipboard+=unnamed

" UK配列は：がうちにくい
nnoremap ; :
" Esc二回でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set guioptions-=T

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

" plugin
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'simeji/winresizer' 
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Townk/vim-autoclose'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'glidenote/memolist.vim'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" color
syntax on 
colorscheme molokai
set t_Co=256 

" vim-ariline
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


" memolist
nnoremap <leader>mn  :MemoNew<CR>
nnoremap <leader>ml  :MemoList<CR>
nnoremap <leader>mg  :MemoGrep<CR>
let g:memolist_path = "~/workspace/memo"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = "~/.vim/template/memolist"

" previm
au BufRead,BufNewFile *.md set filetype=markdown
nnoremap <leader>pv  :PrevimOpen<CR>
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:vim_markdown_folding_disabled = 1

" gitgutter
let g:gitgutter_highlight_lines = 1
set updatetime=250
