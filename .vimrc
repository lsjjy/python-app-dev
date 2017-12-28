" Basic Setting "
"If you do not like the default status line, you can turn on the ruler option.
set ruler

"If you set the 'showcmd' option, any partial command is displayed at the lower-right of
"the screen while you type it.
set showcmd

"The following command causes Vim to highlight any strings found matching the
"search pattern.
set hlsearch

"By default, Vim uses the traditional search method:You specify the string, and then
"Vim performs the search.When you use the following command, the editor performs
"incremental searches.
set incsearch

"If you execute the following command, when you enter any type of bracket ( (, ), [,
"], {, }),Vim will cause the cursor to jump to the matching bracket briefly.
set showmatch

"Indent each new line the same as the previous one.
set autoindent

"If you have 'ignorecase' set, word matches word, WORD, and Word.
set ignorecase

"Turn on line numbering with the following command.
set number

"Turn relative line numbers on.
set relativenumber

"The following command changes the size of the tab stop to 4.
set tabstop=4

"To change the size of the shift width, use the following command.
set shiftwidth=4

"After you execute the following command, every time you press the Tab key the
"cursor moves to the next 4-column boundary.
set softtabstop=4

"Smart indenting is a combination of soft tabs and normal tabs.When you execute
"the following command, Vim treats tabs at the beginning of a line differently.
set smarttab

"If you want absolutely no tabs in your file, you can set the 'expandtab'
"option.
set expandtab

"The 'encoding' option tells Vim the encoding of the characters that you use.
set encoding=utf-8

set colorcolumn=80


"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Plugin Setting "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Syntastic
Plugin 'vim-syntastic/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4

let g:syntastic_python_checkers = ['flake8']

" jedi-vim
Plugin 'davidhalter/jedi-vim'

" molokai
Plugin 'tomasr/molokai'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '▶'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme = 'badwolf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
colorscheme molokai

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Quickly Run "
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    endif
endfunc
