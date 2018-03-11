"=============================================================================
"=    W e l c o m e   t o   m y  V I M R C                                   =
"=============================================================================
let gfbar = "<F2> Next Window, <F3> Next Buffer, <F4> New ShellScript, <F5> Python, <F6> Command, <F7> MRU, <F8> UndoTree, <F9> PasteMode"
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
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'archernar/polymode.vim'
"Plugin 'wincent/scalpel'
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
command! COLORLET :call Colorlet(-1)
command! LIB :call OpenLibrary()
command! Lib :call OpenLibrary()
command! NOTES :call OpenMyNotes()
command! Notes :call OpenMyNotes()
command! BE :call SetRegistersBE()
command! Be :call SetRegistersBE()
                                  " *******************************************************************
                                  " Function Keys
nnoremap <F2> <C-W>w
nnoremap <F3> :bnext<CR>
nnoremap <F4> :new<cr>:-1read $HOME/.vim/ksh.top<CR>
nnoremap <leader><F5> :call Colorlet(-1)<cr><esc>
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
nnoremap <leader><F6> :colorscheme pablo<cr>hi Visual   cterm=reverse<cr><esc>
nnoremap <silent> <F6> :call Tcmd()<CR>
nnoremap <F7> :MRU<cr>
nnoremap <F8> :UndotreeToggle<cr>
nnoremap <F9> :set paste!<cr>
nnoremap <F12> :wa<CR>:!build<CR>
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
nnoremap <silent> <leader><Home> :close<cr>
nnoremap <End>  :call PolyModeReset()<cr>
                                  " *******************************************************************
                                  " Powerline
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
                                  " *******************************************************************
                                  " Set Color Scheme
colorscheme darkblue
colorscheme pablo
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
nnoremap <leader>3 $"tp<esc>0jw
                                  " *******************************************************************
                                  " Tester Mapping

" <li><kbd>TEST</kbd> TEST TEST TESTTEST TEST</li>
" TEST TEST TEST TESTTEST TEST
" source $VIMRUNTIME/menu.vim
" set wildmenu
" set cpo-=<
" set wcm=<C-Z>
" map <F4> :emenu <C-Z>


function! RandomString()
    let l:szAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let l:c = 1
    let l:szOut = ""
    while l:c <= 8
         let l:rrr = str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % 24 
         let l:szOut = l:szOut . l:szAlpha[rrr] 
         let l:c += 1
    endwhile 
    return l:szOut
endfunction

function! SaveAndExecutePython()
    " https://stackoverflow.com/questions/18948491/running-python-code-in-vim
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

                                  " *******************************************************************
                                  " Save and reload current file
                                  " Get file path of current file
    silent execute "update | edit"
    let s:current_buffer_file_path = expand("%")
    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"
                                  " *******************************************************************
                                  " Reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
                                  " *******************************************************************
	                          " bufhidden:  This option specifies what happens when a buffer is no longer displayed in a window
	                          " buftype:    'nofile' means that the buffer is not associated with a file
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
"    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is
    " forced to a height of one line every time you run this function.
    " However without this line the buffer starts off as a default size and if you resize
    " the buffer then it keeps that custom size after repeated runs of this function.
    " But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
    wincmd k
endfunction




function! Tb()
    let l:cWord = shellescape(expand("<cWORD>"))
    call SetRegisterI()
    let l:cWord = @i
    silent execute "update | edit"
    let s:current_buffer_file_path = expand("%")
    let s:output_buffer_name = RandomString()
    let s:output_buffer_filetype = "output"
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
"    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    let l:szCommand = ".!grep -n " .  l:cWord . " " . s:current_buffer_file_path
    silent execute  l:szCommand
    setlocal readonly
    setlocal nomodifiable

endfunction




function! Tcmd()
    call SetRegisterI()
    let l:cWord = @i
    silent execute "update | edit"
    call MakeTempBuffer()

    let l:szCommand = ".!" .  l:cWord
    silent execute  l:szCommand

    call LockTempBuffer()

endfunction




function! MakeTempBuffer()
    let s:current_buffer_file_path = expand("%")
    let s:output_buffer_name = RandomString()
    let s:output_buffer_filetype = "output"
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif
    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
"    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _


endfunction
function! LockTempBuffer()
    setlocal readonly
    setlocal nomodifiable
endfunction




function! SetRegisterI()
      let szIn = input('$ ')
      let @i = szIn
      echo "\r"
      echo ""
endfunction
function! Tput(sz)
    call append(line('$'), a:sz)
endfunction
function! OpenMyNotes()
    call MakeTempBuffer()
    call Tput("My Mappings                                                                                              My Commands ")
    call Tput("F2             Next Window          <leader> F2    Zoom Buffer                                           Lib     Open Reference Files")
    call Tput("F3             Next Buffer          <leader> F3    Un-Zoom Buffer                                        Notes   Open Notes Ref File")
    call Tput("F4             Script with Header   <leader> F4    Close Buffer                                          MRU     Recent Files")
    call Tput("F5             Colorlet        ")
    call Tput("F6             MRU               ")
    call Tput("F7              ")
    call Tput("<Leader>nt     NERDTreeToggle  <Leader>p      PluginUpdate      <leader>ev :split $MYVIMRC               <leader>sv :source $MYVIMRC")
    call Tput("Folding")
    call Tput("zi  switch folding on or off")
    call Tput("za  toggle current fold open/closed")
    call Tput("zc  close current fold")
    call Tput("zR  open all folds")
    call Tput("zM  close all folds")
    call Tput("zv  expand folds to reveal cursor")
    call Tput("")
    call Tput("Tabs and Multiple Files")
    call Tput(":tabnew [file]       - Open a new tab with given file (or empty file)")
    call Tput("gt or :tabn[ext]     - Next tab")
    call Tput("gT or :tabp[revious] - Previous tab")
    call Tput(":tabm[ove] #         - Move current tab to position # (zero-indexed), no argument = end")
    call Tput(":tabc                - Close current tab")
    call Tput(":tabo                - Close all other tabs except current")
    call LockTempBuffer()
endfunction



