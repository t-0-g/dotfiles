set number
set tabstop=4
set shiftwidth=4
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
inoremap { {}<Left>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>
syntax on 
colorscheme molokai
set t_Co=256 
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set guioptions-=T
