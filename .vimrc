"source $VIM/_vimrc
set list
set listchars=eol:_,tab:>\-,extends:<,trail:-
set number
set autoindent
set smartindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch "to cancel, type :noh
set wildmenu
set whichwrap=b,s,h,l,<,>,[,]
set incsearch
set nocompatible
syntax on
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
autocmd FileType ruby :set dictionary=$HOME/.vim/dict/ruby.dict
filetype plugin on


