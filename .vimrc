" General
"Leader
let mapleader = "\<Space>"
nnoremap <Leader>wq :wq<CR> "save & quit : <Leader>+wq

" Indent
set tabstop=2
set shiftwidth=4
set expandtab

set textwidth=0  " 長い文章を書いていても自動で折り返しをしない
set autoread     " 他で書き換えられたら自動で読み直す
set noswapfile   " スワップファイルを作らない
set hidden       " 編集中でも他のファイルを開けるようにする
set vb t_vb=     " ビープをならさない
set title
set number       " 行番号表示
set list         " 不可視文字表示
set listchars=tab:>.
set syntax=on
set ttyfast      "高速ターミナル接続をおこなう

" Move
" 挙動がおかしいのでコメントアウト
"nmap 1 0
"nmap 0 ^  " 行頭へ移動
"nmap 9 $  " 行末へ移動

" Mouse
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" Yank
nmap y9 y$ " 行末までYank
nmap y0 y^ " 行頭までYank

" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" Font
set guifont=Ricty-Regular-nerd-Powerline\ 11

" Clipboard
set clipboard=unnamed,unnamedplus

" File Types
augroup vimrc_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 foldmethod=marker
  autocmd FileType vim :highlight link FoldComment SpecialComment
  autocmd FileType vim :match FoldComment /^".*\({{{\|}}}\)/
  autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType xml setlocal shiftwidth=2 tabstop=2
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType json setlocal shiftwidth=2 tabstop=2
  autocmd FileType zsh setlocal foldmethod=marker
  autocmd FileType zsh :highlight link FoldComment SpecialComment
  autocmd FileType zsh :match FoldComment /^#.*\({{{\|}}}\)/
  autocmd BufRead,BufNewFile *.jenkinsfile set filetype=groovy
augroup END

" Plugins
" Shougo/deing.vim
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " w0rp/ale
  call dein#add('w0rp/ale')
  " 保存時のみ実行する
  let g:ale_lint_on_text_changed = 0
  " 表示に関する設定
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''
  let g:airline#extensions#ale#open_lnum_symbol = '('
  let g:airline#extensions#ale#close_lnum_symbol = ')'
  let g:ale_echo_msg_format = '[%linter%]%code: %%s'
  highlight link ALEErrorSign Tag
  highlight link ALEWarningSign StorageClass
  " Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)

  " prettier/vim-prettier
  call dein#add('prettier/vim-prettier')

  " tyru/open-browser.vim
  call dein#add('tyru/open-browser.vim', {
            \ 'on_map': ['<Plug>(openbrowser-smart-search)'],
            \ 'lazy': 1})
  
  " easymotion/vim-easymotion
  call dein#add('easymotion/vim-easymotion')
  " defalut kye mapping OFF
  let g:EasyMotion_do_mapping = 0
  " <Leader>f{char} to move to {char}
  map  <Leader><Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
  " s{char}{char} to move to {char}{char}
  nmap s <Plug>(easymotion-overwin-f2)
  vmap s <Plug>(easymotion-bd-f2)
  " Move to line
  map <Leader><Leader>L <Plug>(easymotion-bd-jk)
  map <Leader><Leader>L <Plug>(easymotion-overwin-line)
  " Move to word
  map  <Leader><Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

  " scrooloose/nerdtree
  call dein#add('scrooloose/nerdtree') 
  nmap <silent><C-e> :NERDTreeToggle<CR> 
  autocmd VimEnter * execute 'NERDTree'

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
