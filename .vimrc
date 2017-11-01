" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    " My Bundles here:
    "
    " original repos on github
    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'tpope/vim-rails.git'
    Bundle 'mattn/emmet-vim'
    Bundle 'msanders/snipmate.vim'
    Bundle 'vim-scripts/The-NERD-Commenter'
    Bundle 'slim-template/vim-slim'
    " indent guides
    Bundle 'nathanaelkane/vim-indent-guides'
    " indent guides shortcut
    map <silent><F7>  <leader>ig
    Bundle 'scrooloose/nerdtree'
    " vim-scripts repos
    Bundle 'L9'
    Bundle 'FuzzyFinder'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    Plugin 'maksimr/vim-jsbeautify'

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

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
" config it for change buffer without save it when changed
set hidden "in order to switch between buffers with unsaved change
map <silent><F6> :NERDTree<CR>
set nu
map <tab> :tabn<CR>
map <S-tab> :tabprevious<CR>
let g:user_zen_settings = {
      \  'indentation' : '  '
      \}
let g:indent_guides_guide_size = 1

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

map <c-t> :FufCoverageFile!<CR>
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|db/migrate|vendor)'
let g:fuf_enumeratingLimit = 50
let g:fuf_coveragefile_prompt = '=>'
" non github repos
" if you like it more than fuf, uncomment here
" Bundle 'git://git.wincent.com/command-t.git'
" ...
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

autocmd BufRead,BufNewFile *.erb setlocal filetype=html

" code beautification
" for jsx
autocmd FileType javascript.jsx nnoremap <buffer> <leader>ff :call JsxBeautify()<cr>
" javascript
autocmd FileType javascript nnoremap <buffer> <leader>ff :call JsBeautify()<cr>
" for json
autocmd FileType json nnoremap <buffer> <leader>ff :call JsonBeautify()<cr>
" for html
autocmd FileType html nnoremap <buffer> <leader>ff :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css nnoremap <buffer> <leader>ff :call CSSBeautify()<cr>

" debugger
" for python
autocmd FileType python nnoremap <buffer> <leader>db Iimport ipdb; ipdb.set_trace()<cr>
" for ruby
autocmd FileType ruby nnoremap <buffer> <leader>db Irequire "byebug"; byebug<cr>
" for javascript
autocmd FileType javascript nnoremap <buffer> <leader>db Idebugger;<cr>

:nnoremap <leader>p :set paste<cr>
:nnoremap <leader>np :set nopaste<cr>

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
