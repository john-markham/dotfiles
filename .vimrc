set nocompatible

" NOTE: I have symlinked this file to init.vim `ln -s ~/.vimrc init.vim`
if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maralla/completor.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" COC Autocomplete
set updatetime=300

nnoremap <C-P> <Cmd>FZF<Enter>
let g:fzf_action = {
\ 'Enter': 'tabe',
\ 'Tab': 'rightbelow vsplit'
\}

let g:asyncomplete_auto_popup = 0

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"


if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
set number 
set mouse=a
syntax on


set ruler

" ONLY WRITES TO DISK IF CHANGES SINCE LAST WRITE
cnoreabbrev w update

" go to the position i was last at 
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
set backspace=indent,eol,start " allow backspace over everything in insertion mode 
" Unix style line endings
set ff=unix
set showcmd		" display incomplete
set incsearch	" do incremental searching
vnoremap * "*y

" Detect filetype then load plugin file, set syntax highlighting,
" and set indentation accordingly
filetype plugin indent on
if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

inoremap jk <Esc>
inoremap Jk <Esc>
inoremap <Esc> <nop>
set rtp+=/usr/local/opt/fzf
