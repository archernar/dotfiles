"=============================================================================
"=    W e l c o m e   t o   m y  V I M R C                                   =
"=============================================================================
" Notes
" There are several name spaces for variables.
" 
" (nothing)            In a function: local to a function; otherwise: global
" |buffer-variable|    b:	  Local to the current buffer.
" |window-variable|    w:	  Local to the current window.
" |tabpage-variable|   t:	  Local to the current tab page.
" |global-variable|    g:	  Global.
" |local-variable|     l:	  Local to a function.
" |script-variable|    s:	  Local to a |:source|'ed Vim script.
" |function-argument|  a:	  Function argument (only inside a function).
" |vim-variable|       v:	  Global, predefined by Vim.
" nnoremap <F4> :new<cr>:-1read $HOME/.vim/ksh.top<CR>
"=============================================================================
let g:help0 = "<F1> NxtWin <F2> NxtBuf <F3> MRU <F4> NextTab   <F5> Python <F6> Command <F8> UndoTree <F9> PasteMode"
let g:help1 = "OHHHH"
let g:help2 = "NOPE"
set nocompatible
set hidden
set foldcolumn=3
set foldmethod=marker
set foldlevelstart=20
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
filetype off


" let NOVUNDLE = 1
if !exists("NOVUNDLE")
" *****************************************************************************************************
                                  " Vundle
                                  " *******************************************************************
                                  " Vundle            - see :h vundle for more details or wiki for FAQ
                                  " git clone  https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
                                  " :PluginList       - lists configured plugins
                                  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
                                  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
                                  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
                                  " *******************************************************************
set rtp+=~/.vim/bundle/Vundle.vim " Vundle BEGIN
call vundle#begin()               " Vundle BEGIN
                                  " *******************************************************************
Plugin 'VundleVim/Vundle.vim'
Plugin 'archernar/polymode.vim'
Plugin 'archernar/vimstuff'
Plugin 'scrooloose/nerdtree.git'
" Plugin 'kristijanhusak/vim-carbon-now-sh'
" Plugin 'Buffergator'
" Plugin 'tpope/vim-fugitive'
" Plugin 'mbbill/undotree'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'gmarik/github-search.vim'
"Plugin 'xolox/vim-misc'           " https://github.com/xolox/vim-misc 
"Plugin 'xolox/vim-notes'          " https://vimawesome.com/plugin/notes-vim
"Plugin 'file:///home/mestes/scm/polymode.vim'
"Plugin 'wincent/scalpel'
"Plugin 'tpope/surround'
"Plugin 'mhinz/vim-startify'
"Plugin 'yegappan/mru'
                                  " *******************************************************************
call vundle#end()                 " Vundle END 
endif                             " Vundle END
                                  " *******************************************************************

                                  
                                  " *******************************************************************
filetype plugin indent on         " required, to ignore plugin indent changes, instead use: 
                                  " filetype plugin on
                                  " Put non-Plugin stuff after this line

" *****************************************************************************************************
                                  " Command Words/Aliases
                                  " *******************************************************************
command REPOS :call OpenRepoListInTempBuffer()
command! TERMINAL :call Terminal()
command! KSH :call OpenKshTop()
command! GAWK :call SaveAndExecuteGawk()
command! COLORLET :call Colorlet(-1)
command! BE :call SetRegistersBE()
command! Be :call SetRegistersBE()
" *****************************************************************************************************
                                  " Function Keys
                                  " *******************************************************************
" nnoremap <leader><F5> :call Colorlet(-1)<cr><esc>
" nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
" vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
nnoremap <leader><F6> :colorscheme pablo<cr>hi Visual   cterm=reverse<cr><esc>
nnoremap <silent> <F6> :call Tcmd()<CR>
nnoremap <F8> :UndotreeToggle<cr>
nnoremap <F9> :set paste!<cr>
nnoremap <F12> :wa<CR>:!build<CR>
nnoremap <leader><F12> :call SaveAndExecuteGawk()<CR>
" *****************************************************************************************************
                                  " Leader Function Keys
                                  " *******************************************************************
nnoremap <silent> <leader><F2> :wincmd _<cr>:wincmd \|<cr>
nnoremap <silent> <leader><F3> :wincmd =<cr>
nnoremap <silent> <leader><F4> :close<cr>
" *****************************************************************************************************
                                  " Leader Keys
                                  " *******************************************************************
nnoremap <leader>] *
nnoremap <Leader>' diwi""<ESC>hp<ESC>
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <Leader>p  :PluginUpdate<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
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

" *****************************************************************************************************
                                  " MJE Polymode Keys
                                  " *******************************************************************
nnoremap <Home> :call PolyMode(-1)<cr>
nnoremap <End>  :call PolyModeReset()<cr>
function! PolyModeMapReset()
          nnoremap <F1> <C-W>w:call PolyModeReset()<cr>
          nnoremap <F2> :bnext<CR>:call PolyModeReset()<cr>
          nnoremap <F3> :MRU<cr>
          nnoremap <F4> :tabn<cr>
          nnoremap <silent> 1 1
          nnoremap <silent> 2 2
          nnoremap <silent> 3 3
          nnoremap <silent> a a
          nnoremap <silent> b b
          nnoremap <silent> c c
          nnoremap <silent> d d
          nnoremap <silent> f f
          nnoremap <silent> e e
          nnoremap <silent> o o
          nnoremap <silent> O O
          nnoremap <silent> r r
          nnoremap <silent> v v
          nnoremap <silent> s s
          nnoremap <silent> n n
          nnoremap <silent> <Insert>   <Nop>
          nnoremap <silent> <Right>    <right>
          nnoremap <silent> <Left>     <left>
          nnoremap <silent> <Up>       <up>
          nnoremap <silent> <Down>     <down>
          nnoremap <silent> <PageUp>   <pageup>
          nnoremap <silent> <PageDown> <pagedown>
          nnoremap <silent> <Delete>   <delete>
          nnoremap <silent> <End>  :call PolyModeReset()<cr>
endfunction
call PolyModeMapReset()


" *****************************************************************************************************

vmap \q c()<ESC>P
" nnoremap <PageDown> viwo<esc>i[<esc>lviw<esc>a]<esc>
          nnoremap <PageDown> viWo<esc>i"<esc>lviW<esc>a"<esc>
          let @c = "\""
          nnoremap <PageDown> viWo<esc>"cP<esc>lviW<esc>"cp<esc>
          vnoremap <PageUp> o<esc>^i# ------------------------------------------------------------------<cr>#  <cr><esc>kll
          vnoremap <silent> <Home> :s/^/# /<cr>
          vnoremap <silent> <leader><Home> :s/^[#][ ]//<cr>
nnoremap <Insert> <Nop>

" *****************************************************************************************************
                                  " Auto Commands
                                  " *******************************************************************
if !exists("myautocommands_loaded")
     let myautocommands_loaded = 1
     " au BufNewFile,BufRead *.awk vnoremap <silent> <Home> :s/^/\/\/ /<cr>gv
     " au BufNewFile,BufRead *.awk vnoremap <silent> <leader><Home> :s/^[/][/][ ]//<cr>
     au BufNewFile,BufRead *.java vnoremap <silent> <Home> :s/^/\/\/ /<cr>gv
     au BufNewFile,BufRead *.java vnoremap <silent> <leader><Home> :s/^[/][/][ ]//<cr>
     au BufNewFile,BufRead .vimrc vnoremap <silent> <Home> :s/^/" /<cr>gv
     au BufNewFile,BufRead .vimrc vnoremap <silent> <leader><Home> :s/^["] //<cr>
     au BufNewFile,BufRead .vimrc vnoremap <silent> <leader><PageUp> o<esc>^i" ------------------------------------------------------------------<cr>"  <cr><esc>kll
     au BufNewFile,BufRead *.vim vnoremap <silent> <Home> :s/^/" /<cr>gv
     au BufNewFile,BufRead *.vim vnoremap <silent> <leader><Home> :s/^["] //<cr>
endif
" *****************************************************************************************************
                                  " Powerline
                                  " *******************************************************************
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
" *****************************************************************************************************
                                  " Set Color Scheme
                                  " *******************************************************************
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
" set wildmenu
" set cpo-=<
" set wcm=<C-Z>
" map <F4> :emenu <C-Z>

" *****************************************************************************************************
                                  " Functions
                                  " *******************************************************************
function! VimKeyMap()
     redir! > ~/.vimkeymap.txt
     silent verbose map
     redir END
endfunction

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
    call MakeTempBuffer()

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)
    call LockTempBuffer()
    wincmd k
endfunction

function! SaveAndExecutePython22222()
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



function! OpenRepoListInTempBuffer()
     silent execute "!curl -s 'https://api.github.com/users/archernar/repos?per_page=100' | grep ssh_url >/tmp/myrepos"
     call OpenInTempBuffer("/tmp/myrepos")
endfunction

function! OpenInTempBuffer(...)
     call MakeTempBuffer()
     execute "edit ". a:1
     nnoremap <silent> <buffer> <Home>   :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <Insert> :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <End>    :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <PageUp> :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <PageDown> :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <Delete> :close<cr>:call PolyModeReset()<cr>
     call LockTempBuffer()
endfunction
function! EditInTempBuffer(...)
     call MakeTempBuffer()
     execute "edit ". a:1
     nnoremap <silent> <buffer> <Home>   :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <Insert> :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <End>    :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <PageUp> :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <PageDown> :close<cr>:call PolyModeReset()<cr>
     nnoremap <silent> <buffer> <Delete> :close<cr>:call PolyModeReset()<cr>
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
function! Terminal()
    execute "silent !gnome-terminal --title=vimsterTerm --geometry 135x30x200x200 &"
    redraw!
endfunction
function! OpenKshTop()
    call MakeTempBuffer()
    call Tput("#!/usr/bin/ksh")
    call Tput("Tmp=\"/tmp/$$\"")
    call Tput("TmpDir=\"/tmp/dir$$\"")
    call Tput("trap 'rm -f \"$Tmp\" >/dev/null 2>&1' 0")
    call Tput("trap \"exit 2\" 1 2 3 13 15")
    call Tput("")
endfunction


function! SaveAndExecuteGawk()
    let s:current_buffer_file_path = expand("%")
    silent execute "update | edit"
    call MakeTempBuffer()
    silent execute ".!gawk -f " . shellescape(s:current_buffer_file_path, 1) . " input.txt"
    call LockTempBuffer()
endfunction

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal! g'\"" | endif
endif


" https://stackoverflow.com/questions/11176159/how-to-jump-to-start-end-of-visual-selection
