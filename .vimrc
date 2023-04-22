"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/a13694/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/a13694/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/a13694/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" This is a Vim plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more.
call dein#add('rust-lang/rust.vim')

" Let's enrich our lives with GitHub Copilot.
"if has('nvim') || has('patch-9.0.0185')
"  call dein#add('github/copilot.vim')
"endif

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" automatic running of :RustFmt when you save a buffer.
let g:rustfmt_autosave = 1

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set number
