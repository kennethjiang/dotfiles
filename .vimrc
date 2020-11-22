" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'karlbright/qfdo.vim'
Plug 'maksimr/vim-jsbeautify'


" Initialize plugin system
call plug#end()

set nocompatible               " be iMproved
filetype on
syntax on

" my configure
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noimdisable
set iminsert=0
set imsearch=0
set noswapfile
set tabpagemax=100
" config it for change buffer without save it when changed
set hidden "in order to switch between buffers with unsaved change
set nu
map <tab> :tabn<CR>
map <S-tab> :tabprevious<CR>
let g:user_zen_settings = {
      \  'indentation' : '  '
      \}
let g:indent_guides_guide_size = 1
set autowrite


" hightlight col and line
" set cursorline
" set cursorcolumn

if has("gui_running")
  colorscheme desert
  set ruler
  set gfn=Monaco:h16
  set shell=/bin/bash
endif

" javascript, JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let mapleader= ","
" EasyMotion_leader_key .

filetype plugin indent on     " required! 

"
" Highlight trailing whitespace
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufWritePre *.rb,*.py,*.js %s/\s\+$//e

autocmd BufRead,BufNewFile *.erb setlocal filetype=html

" debugger
" for python
autocmd FileType python nnoremap <buffer> <leader>db Iimport ipdb; ipdb.set_trace()<cr>
" for ruby
autocmd FileType ruby nnoremap <buffer> <leader>db Irequire "byebug"; byebug<cr>
" for javascript
autocmd FileType javascript nnoremap <buffer> <leader>db Idebugger;<cr>

:nnoremap <leader>p :set paste<cr>
:nnoremap <leader>np :set nopaste<cr>

:nnoremap <leader>g :Grepper<cr>
" let g:grepper = { 'next_tool': '<leader>g' }

let g:ctrlp_max_files=0

:nmap <Leader>ff <Plug>(Prettier)
" Prettier config
let g:prettier#config#print_width = 140
let g:prettier#config#tab_width = 4
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#jsx_bracket_same_line = 'false'

" for html
autocmd FileType html,eruby nnoremap <buffer> <leader>ff :call HtmlBeautify()<cr>
