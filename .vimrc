set nocompatible              " be iMproved, required
filetype off                  " required

" automatically resize vim windows on resize
autocmd VimResized * :wincmd =

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'textobj-user'
Plugin 'ctrlpvim/ctrlp.vim'

" tells vim where to find the tags file for ctags
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'

" COLORS!!
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just:PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` t auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on " Enable syntax highlighting
colorscheme jellybeans

runtime macros/matchit.vim

" use the space key as the leader for custom commands
let mapleader = "\<Space>"

map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
map <leader>so :source $MYVIMRC<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>vi :sp $MYVIMRC<cr>

" Convert 1.8 hash syntax to 1.9 syntax
nnoremap <leader>19 :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>
vnoremap <leader>19 :s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>
nnoremap <leader>18 :%s/\(\w\+\):\s/:\1 => /gc<cr>
vnoremap <leader>18 :s/\(\w\+\):\s/:\1 => /g<cr>

" change surrounding quotes
map <leader>' cs"'
map <leader>" cs'"
" indent all
map <leader>i mmgg=G`m

set rnu
set ruler
set showcmd " show incomplete commands
set laststatus=2 " always show status bar
set nowrap
set incsearch

" 2 spaces for tabs
set tabstop=2
set shiftwidth=2
set expandtab
retab
set cursorline
set backspace=indent,eol,start
set scrolloff=4       " keep at least 4 lines below the cursor
set smarttab

" show where 80 characters is
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=0 guibg=lightgrey

" open new split panes to the right and bottom
set splitbelow
set splitright

" [buffer number] followed by filename:
set statusline=[%n]\ %t
" syntastic messages
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show line#:column# on the right hand side
set statusline+=%=%l:%c

" Syntastic defaults
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
