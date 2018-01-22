"=============================================================================
"=    W e l c o m e   t o   m y  V I M R C                                   =
"=============================================================================
set nocompatible
set hidden
set foldcolumn=3
set foldmethod=marker
set ruler                         " Display the cursor position on the last line of the screen or in the status line of a window
set number                        " Display line numbers on the left
set wildmenu                      " Better command-line completion
set showcmd                       " Show partial commands in the last line of the screen
set ignorecase                    " Use case insensitive search, except when using capital letters
set smartcase
" set hlsearch incsearch            " Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)
set backspace=indent,eol,start    " Allow backspacing over autoindent, line breaks and start of insert action
set nostartofline                 " Stop certain movements from always going to the first character of a line.
set laststatus=2                  " Always display the status line, even if only one window is displayed
set autoindent                    " When opening a new line and no filetype-specific indenting is enabled, keep same indent as line currently on.
set confirm                       " Instead of failing a command because of unsaved changes, raise a dialogue asking to save changed files.
set visualbell                    " Use visual bell instead of beeping when doing something wrong
set t_vb=
                                  " reset terminal code for visual bell. 
                                  " If visualbell is set, and this line is also included, vim will neither flash nor beep.
                                  " If visualbell is unset, this does nothing.
set cmdheight=2                   " Set the command window height to 2 lines, to avoid many cases of having to  press <Enter> to continue
set pastetoggle=<F11>             " Use <F11> to toggle between 'paste' and 'nopaste'
set shiftwidth=4                  " Indent settings for using 4 spaces instead of tabs.  Do not change 'tabstop' from its default value of 8 
set softtabstop=4                 " with this setup.
set expandtab
let mapleader = " "               " Leader - ( Spacebar )
let MRU_Auto_Close = 1            " Set MRU window to close after selection
set notimeout ttimeout ttimeoutlen=200         " Quickly time out on keycodes, but never time out on mappings
syntax off                        " Enable syntax highlighting

                                  " Vundle            - see :h vundle for more details or wiki for FAQ
                                  " git clone  https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
                                  " :PluginList       - lists configured plugins
                                  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
                                  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
                                  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
                                  " *******************************************************************
                                  " Auto Commands
                                  " *******************************************************************
                                  " *******************************************************************
                                  " Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
                                  " *******************************************************************
call vundle#begin()               " Vundle BEGIN
Plugin 'VundleVim/Vundle.vim'
" Plugin 'file:///home/mestes/scm/polymode.vim'
Plugin 'archernar/polymode.vim'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'Buffergator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'mbbill/undotree'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'gmarik/github-search.vim'
"Plugin 'mhinz/vim-startify'
" Plugin 'yegappan/mru'
call vundle#end()                 " Vundle END 
                                  " *******************************************************************
filetype plugin indent on         " required, to ignore plugin indent changes, instead use: filetype plugin on
                                  " *******************************************************************
                                  " Put non-Plugin stuff after this line
" *****************************************************************************************************
                                  " *******************************************************************
                                  " Command Words
command! LIB :call OpenLibrary()
command! Lib :call OpenLibrary()
command! NOTES :call OpenNotes()
command! Notes :call OpenNotes()
command! BE :call SetRegistersBE()
command! Be :call SetRegistersBE()
                                  " *******************************************************************
                                  " Function Keys
nnoremap <F2> <C-W>w
nnoremap <F3> :bnext<CR>
nnoremap <F4> :new<cr>:-1read $HOME/.vim/ksh.top<CR>
nnoremap <F5> :call Colorlet(-1)<cr>
nnoremap <F6> :MRU<cr>
                                  " *******************************************************************
                                  " Leader Function Keys
nnoremap <silent> <leader><F2> :wincmd _<cr>:wincmd \|<cr>
nnoremap <silent> <leader><F3> :wincmd =<cr>
nnoremap <silent> <leader><F4> :close<cr>
                                  " *******************************************************************
                                  " Leader Keys
nnoremap <leader>] *
nnoremap <Leader>' diwi""<ESC>hp<ESC>
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <Leader>p  :PluginUpdate<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>-  :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>=  :wincmd =<cr>
nnoremap <leader>l  :resize -5<cr>
nnoremap <leader>m  :resize +5<cr>
nnoremap <leader>g  :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>h  :silent execute "help " . expand("<cWORD>")<cr> 
let g:vim_notes_is_open = 0
let g:vim_notes         = "/home/mestes/.vim/vimnotes"
nnoremap <leader>q :call VimNotesToggle()<cr>
nnoremap <leader>w :call Smash()<cr>
                                  " *******************************************************************
                                  " MJE Polymode Keys
nnoremap <Home> :call PolyMode(-1)<cr>
nnoremap <End>  :call PolyModeReset()<cr>
                                  " *******************************************************************
                                  " Powerline
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
                                  " *******************************************************************
                                  " Set Color Scheme
colorscheme darkblue
hi Visual   cterm=reverse

" nnoremap <silent> <Leader><PageUp> :wincmd _<cr>:wincmd \|<cr>
" nnoremap <silent> <Leader><PageDown> :wincmd =<cr>


                                  " *******************************************************************
                                  " Quick Customizations
nnoremap <leader>x  $a<br><esc>0j<esc>
nnoremap <leader>w viw<esc>a"<esc>bi"<esc>lel
let @b = "<li><kbd>"
let @e = "</kbd>"
let @t = "</li>"
nnoremap <leader>1 "bP<esc>
nnoremap <leader>2 "ep<esc>
nnoremap <leader>3 "tp<esc>

" <li><kbd>TEST</kbd> TEST TEST TESTTEST TEST</li>
" TEST TEST TEST TESTTEST TEST
" source $VIMRUNTIME/menu.vim
" set wildmenu
" set cpo-=<
" set wcm=<C-Z>
" map <F4> :emenu <C-Z>
