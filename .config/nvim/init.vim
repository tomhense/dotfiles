set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click

filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set noswapfile            " disable creating swap file
" set backspace=indent,eol,start  " Backspace behavior
" set backupdir=~/.cache/vim " Directory to store backup files.
set splitbelow             " Split below
set list lcs=tab:\|\        " Show identation
set autochdir               " Automatically change current working directory
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
"set conceallevel=0  " enable conceal support
"set scrolloff=5
set spelllang=en,de

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

tnoremap <Esc> <C-\><C-n>  " Use esc to exit terminal mode
 
filetype plugin indent on

" Force python to use tab identation
autocmd Filetype python setlocal sw=4 ts=4 expandtab!

" Add command to reload vi config
command Reloadconfig source $MYVIMRC

set clipboard=unnamedplus


" ----------- Plugins -----------

" Automate plug install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endi

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
"Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'ervandew/supertab'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-surround'
Plug 'brennier/quicktex'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/jasonccox/vim-wayland-clipboard'
Plug 'NLKNguyen/papercolor-theme'
Plug 'peterhoeg/vim-qml'

if executable('aw-qt')  " Only install aw-watcher if aw is installed on system
	Plug 'https://github.com/ActivityWatch/aw-watcher-vim'
	"call AWStart()  " Start Activity Watch plugin
endif
Plug 'https://github.com/ActivityWatch/aw-watcher-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

" ---------- Plugin Options --------

" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1

" Nerdtree
nnoremap <F3> :NERDTreeToggle<CR>

" Easymotion
"let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
"map s <Plug>(easymotion-prefix)
"nmap <C-f> <Plug>(easymotion-overwin-f2)

" --------- Colorscheme -----------
let g:rehash256 = 1
let g:onedark_termcolors = 256

" Auto darkmode
function AutoDarkmode()
	if system('detect-darkmode') == 'light'
		set background=light
		colorscheme PaperColor
	else
		set background=dark
		colorscheme molokai
	endif
endfunction
command AutoDarkmode :call AutoDarkmode() 
call AutoDarkmode()

" Fix markdown latex synthex highlighting
function! MathAndLiquid()
    syn region math start=/\$\$/ end=/\$\$/
    syn match math_block '\$[^$].\{-}\$'
    syn match liquid '{%.*%}'
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    syn region highlight_block start='```' end='```'
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

" Vimtex viewer options
"let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Collapse latex code to unicode
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_syntax_conceal = {
	\ 'accents': 1,
	\ 'cites': 1,
	\ 'fancy': 1,
	\ 'greek': 1,
	\ 'math_bounds': 1,
	\ 'math_delimiters': 1,
	\ 'math_fracs': 1,
	\ 'math_super_sub': 1,
	\ 'math_symbols': 1,
	\ 'sections': 0,
	\ 'styles': 1,
	\}

" Hide certain vimtex errors
let g:vimtex_quickfix_ignore_filters = [
	\ 'Underfull', 'Overfull', 'Undefined control sequence',
	\ 'Missing number, treated as zero', 'Float(s) lost', 'Not in outer par mode'
\]
let g:Tex_IgnoreLevel = 8
