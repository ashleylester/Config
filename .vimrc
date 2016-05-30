" Requirement for Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
" Fonts and color schemes
set guifont=Inconsolata\ 12
colorscheme nucolors
" Hide scroll bar and toolbar
set guioptions-=r
set guioptions-=T
" Line numbers are relative to the current line (helps in jumping with 10j or
" 7k and so on
set relativenumber
" ctrlp remaps for fast file finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
