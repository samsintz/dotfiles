" Don't try to be vi compatible
set nocompatible

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" visual plugins
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" language plugins
Plug 'sheerun/vim-polyglot' 
"Plug 'dense-analysis/ale' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'shougo/denite.nvim'

call plug#end()


" True colors -- note this does not work with onedark
if (has("termguicolors"))
"    set termguicolors
endif

" Theming note that the ctermbg and termcolors bs is needed
" to avoid having the wrong background color
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
syntax on
set background=dark
colorscheme onedark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" lightline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

" coc

" denite
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction


set cmdheight=2

" Show line numbers
set number

" Highlight matching brace
set showmatch

" Highlight all search results
set hlsearch

" Autoindent new lines
set autoindent

" Spaces instead of tabs and auto indent
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" Encoding
set encoding=utf-8

" Ruler
set ruler

