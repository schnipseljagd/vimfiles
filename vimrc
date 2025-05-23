" enter vim mode
set nocompatible
" set up Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" list of plugins installed by Vundle
Bundle 'gmarik/vundle'
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'ack.vim'
Bundle 'vim-flake8'
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'bling/vim-airline'
Bundle 'fatih/vim-go'
Bundle 'taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'honza/dockerfile.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'elzr/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'chase/vim-ansible-yaml'
Bundle 'stephpy/vim-yaml'
Bundle 'mattn/webapi-vim'

" Clojure Plugins
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-sexp'
" Bundle 'paredit.vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fireplace'
Bundle 'rainbow_parentheses.vim'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
Bundle 'jpalardy/vim-slime'

" Elm Plugins
Bundle "lambdatoast/elm.vim"

" Ruby Plugins
Bundle 'thoughtbot/vim-rspec'

" Rust Plugins
Bundle 'hashivim/vim-terraform'

" Elixir
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'ngmy/vim-rubocop'

Plugin 'rust-lang/rust.vim'

" end of Vundle setup

filetype plugin indent on

" -------------------------------------------

let mapleader = ","
let maplocalleader = ","
set t_Co=256
"set background=dark
"let g:rehash256 = 1
"set guifont=DejaVu_Sans_Mono:h9:cANSI
syntax on
set ruler
set showcmd
set hlsearch
" Allow backspace over everything in insert mode
set backspace=indent,eol,start

" Make vim-airline work
set laststatus=2

set modeline
set modelines=5

set nu
set cursorline
set cursorcolumn

" Stuff for auto indent and different filetypes
augroup vimrc
au!
autocmd FileType ant setlocal sw=2 sts=2 et
autocmd FileType sh setlocal sw=4 sts=4 et
autocmd FileType bash setlocal sw=4 sts=4 et
autocmd FileType xml setlocal sw=2 sts=2 et
autocmd FileType python setlocal sw=4 sts=4 et tw=72
autocmd FileType php setlocal sw=4 sts=4 et
autocmd FileType rst setlocal sw=4 sts=4 et
autocmd FileType ruby setlocal ai sw=2 sts=2 et
autocmd FileType cucumber setlocal sw=2 sts=2 et
autocmd FileType java setlocal sw=2 sts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 et
autocmd FileType coffee setlocal sw=2 sts=2 et
autocmd FileType htmldjango setlocal sw=4 sts=4 et
autocmd FileType jsp setlocal sw=2 sts=2 et
autocmd FileType html setlocal sw=2 sts=2 et
autocmd FileType xhtml setlocal sw=2 sts=2 et
autocmd FileType json setlocal sw=2 sts=2 et
autocmd FileType groovy setlocal sw=4 sts=4 et
autocmd FileType yaml setlocal sw=2 sts=2 et
autocmd FileType elm setlocal sw=2 sts=2 et
autocmd FileType tf setlocal sw=4 sts=4 et
"autocmd FileType go setlocal sw=4 sts=4 et
autocmd BufNewFile,BufRead Capfile setf ruby
autocmd BufNewFile,BufRead Vagrantfile setf ruby
autocmd FileType ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" --------------------
"  " TagList
"  " --------------------
"  " F4:  Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>

" --------------------
"  " NERDTree
"  " --------------------
"  " F5:  Switch on/off NERDTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" --------------------
" CtrlP
" --------------------
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Vim settings for cnext etc.
map <F2>  :cprev<CR>
map <F3>  :cnext<CR>

" --------------------
"  Stuff for clojure
" --------------------
let g:clj_highlight_builtins = 1
let g:clj_paren_rainbow = 10
let g:rbpt_colorpairs = [
  \[ 'yellow'      , 'orange1'],
  \[ 'green'       , 'yellow1'],
  \[ 'cyan'        , 'greenyellow'],
  \[ 'magenta'     , 'green1'],
  \[ 'red'         , 'springgreen1'],
  \[ 'yellow'      , 'cyan1'],
  \[ 'green'       , 'slateblue1'],
  \[ 'cyan'        , 'magenta1'],
  \[ 'magenta'     , 'purple1'],
  \[ 'darkyellow'  , 'orangered3'],
  \[ 'darkgreen'   , 'orange2'],
  \[ 'blue'        , 'yellow3'],
  \[ 'darkmagenta' , 'olivedrab4'],
  \[ 'red'         , 'green4'],
  \[ 'darkyellow'  , 'paleturquoise3'],
  \[ 'darkgreen'   , 'deepskyblue4'],
  \[ 'blue'        , 'darkslateblue'],
  \[ 'darkmagenta' , 'darkviolet'],
\]
let g:rbpt_max = 16
" --------------------
" Stuff for Python
"
autocmd FileType python set omnifunc=pythoncomplete#Complete
set tags+=$HOME/.vim/tags/python.ctags
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
au FileType python nnoremap <leader>r :!python %<Enter>
au FileType python nnoremap <leader>t :!green<Enter>

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

let g:airline_powerline_fonts = 1

" Do not automagically install Go stuff
let g:go_disable_autoinstall = 1

let g:go_fmt_command = "goimports"

" Some convinience for go stuff
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" vim slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "0.1"}

" tmux
let g:tmux_navigator_save_on_switch = 1

" disable Background Color Erase
" https://sunaku.github.io/vim-256color-bce.html
set t_ut=

" json always show double quotes
let g:vim_json_syntax_conceal = 0

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" comfortable esc
inoremap jj <esc>

" elm shortcuts
au FileType text nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" RSpec.vim mappings
au FileType ruby map <Leader>r :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby map <Leader>l :call RunLastSpec()<CR>
au FileType ruby map <Leader>a :call RunAllSpecs()<CR>

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
