" Fallback vimrc, if neovim is not installed


syntax on
colorscheme slate
filetype plugin indent on

set autoindent
set number
set relativenumber
set termguicolors
set mouse=a
set expandtab
set shiftwidth=4
set encoding=utf-8

" Keymappings
nmap H _
nmap L $

vmap H _
vmap L $

let mapleader = " "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>e :e <C-R>=expand('%:p:h') . '/' <CR>
