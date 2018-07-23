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
set nocompatible
set relativenumber
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
set shiftwidth=4                  " Indent settings for using 4 spaces instead of tabs.  Do not change 'tabstop' from its default value of 8 
set softtabstop=4                 " with this setup.
set expandtab
let mapleader = " "               " Leader - ( Spacebar )
let MRU_Auto_Close = 1            " Set MRU window to close after selection
set notimeout ttimeout ttimeoutlen=200         " Quickly time out on keycodes, but never time out on mappings

" *****************************************************************************************************
                                  " The 'External Command' Command Setup
                                  " *******************************************************************
command! -nargs=* -complete=shellcmd R new  | let w:scratch = 1 | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
command! -nargs=* -complete=shellcmd V vnew | let w:scratch = 1 | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
command! -nargs=1 L silent call Redir(<f-args>)
command! -nargs=1 P !xdg-open "<f-args>" >/dev/null 2>&1

" Usage:
"       :Redir hi ............. show the full output of command ':hi' in a scratch window
"       :Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window

" *****************************************************************************************************
                                  " Compete Pre Vundle Setup
                                  " *******************************************************************
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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/grep.vim'      " https://github.com/vim-scripts/grep.vim
Plugin 'tpope/vim-surround'


"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'kristijanhusak/vim-carbon-now-sh'
"Plugin 'Buffergator'
"Plugin 'tpope/vim-fugitive'
"Plugin 'mbbill/undotree'
"Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'gmarik/github-search.vim'
"Plugin 'xolox/vim-misc'           " https://github.com/xolox/vim-misc 
"Plugin 'xolox/vim-notes'          " https://vimawesome.com/plugin/notes-vim
"Plugin 'file:///home/mestes/scm/polymode.vim'
"Plugin 'wincent/scalpel'
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
                                  " MJE MyKeyMapper 
                                  " *******************************************************************
let g:MyKeyList = []
let g:MyValueList = []
let g:MyKeyDict = {} 
let g:MyKeyMapperMode = "STD " 
function! g:MyKeyMapper(...)
     let l:szKey = substitute(a:1, "<silent> ", "", "")
     let l:szKey = substitute(l:szKey, "nnoremap ", "", "")
     let l:szKey = substitute(l:szKey, " .*$", "", "g")
     let g:MyKeyDict[g:MyKeyMapperMode . " " . l:szKey] = a:2
     execute a:1
endfunction
function! g:MyCommandMapper(...)
"    command! ULS     :L ls /usr/share/vim/vim74/doc
     let l:szCommand = substitute(a:1, "command! ", "", "")
     let l:szCommand = substitute(l:szCommand, '^[A-Z,0-9]*[ ]*',"", "")
     let l:szKey = substitute(a:1, "command! ", "", "")
     let l:szKey = substitute(l:szKey, " .*$", "", "g")
     let g:MyKeyDict[g:MyKeyMapperMode . " " . l:szKey] = l:szCommand 
     execute a:1
endfunction
function! g:MyStaticMapper(...)
     let g:MyKeyDict[g:MyKeyMapperMode . " " . a:1] = a:2
endfunction
function! MyKeyMapperDumpSeek()
"    zt puts current line to top of screen
"    z. or zz puts current line to center of screen
"    zb puts current line to bottom of screen
     let wuc = expand("<cword>") 
     let currentLine   = getline(".")
     let l:nn=0
     let l:Here = line(".")
     normal! G
     let l:There = line(".")
     call cursor(l:Here, 1)
     while ( (l:nn < l:There) && (wuc ==  expand("<cword>")) )
          execute "normal j"
          let l:nn= l:nn + 1
          if (l:nn >= l:There) 
               let l:nn=1
               call cursor(1, 1)
          endif
     endwhile
     normal! zt 
endfunction
function! MyKeyMapperDump()
        vnew
        nnoremap <silent> <buffer> q :close<cr>
        nnoremap <silent> <buffer> <F8>  :close<cr>
        nnoremap <silent> <buffer> <leader><F8>  :close<cr>
        nnoremap <silent> <buffer> s  :call MyKeyMapperDumpSeek()<cr>
        let w:scratch = 1
        let l:nn=1
        let l:maxline=-1
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
	for key in sort(keys(g:MyKeyDict))
          let l:line=key . repeat(' ', 18-len(key)) . g:MyKeyDict[key]
          call setline(l:nn, l:line)
          let l:nn= l:nn + 1
	endfor
        vertical resize 80 
endfunction
" *****************************************************************************************************
                                  " Function Keys
                                  " *******************************************************************
" nnoremap <leader><F5> :call Colorlet(-1)<cr><esc>
" nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
" vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
" nnoremap <leader><F6> :colorscheme pablo<cr>hi Visual   cterm=reverse<cr><esc>
" nnoremap <F8> :UndotreeToggle<cr>
" nnoremap <leader><F12> :call SaveAndExecuteGawk()<CR>
" *****************************************************************************************************
                                  " Leader Function Keys
                                  " *******************************************************************
nnoremap <silent> <leader><F2> :wincmd _<cr>:wincmd \|<cr>
nnoremap <silent> <leader><F3> :wincmd =<cr>
nnoremap <silent> <leader><F4> :close<cr>
" *****************************************************************************************************
                                  " Leader Keys
                                  " *******************************************************************
nnoremap <Leader>k 0i"<esc>$a"<esc>$a,"")<esc>0icall g:MyKeyMapper(<esc>0
nnoremap <leader>] *
nnoremap <Leader>' diwi""<ESC>hp<ESC>
call g:MyKeyMapper("nnoremap <Leader>nt :NERDTreeToggle<cr>","NERDTree Toggle")
call g:MyKeyMapper("nnoremap <Leader>p  :PluginUpdate<cr>","Vundle Update")
call g:MyKeyMapper("nnoremap <leader>ev :split $MYVIMRC<cr>","Split Edit .vimrc")
nnoremap <leader>-  :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>=  :wincmd =<cr>
call g:MyKeyMapper("nnoremap <leader>l :resize -5<cr>","Window Resize +")
call g:MyKeyMapper("nnoremap <leader>m :resize +5<cr>","Window Resize -")
nnoremap <leader>g  :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>h  :silent execute "help " . expand("<cWORD>")<cr> 
let g:vim_notes_is_open = 0
let g:vim_notes         = "/home/mestes/.vim/vimnotes"
nnoremap <leader>q :call VimNotesToggle()<cr>
nnoremap <leader>w :call Smash()<cr>

let g:greppy_mode_active = 0
function! Greppyon(...)
    execute "ccl"
    if a:0 > 0 
         let s:szIn = input('grep for >> ')
         execute "vimgrep /" . s:szIn . "/ %"
    else
         execute "vimgrep /" . expand("<cword>") . "/ %"
    endif
    execute "cw"
    let g:greppy_mode_active = 1
endfunction
function! Greppyoff()
    execute "ccl"
    let g:greppy_mode_active = 0
endfunction
" *****************************************************************************************************
                                  " MJE MyItem 
                                  " *******************************************************************
let g:MyItemList = []
function! g:MyItem(...)
     if ( a:0 > 1)
          let l:line =  a:1 . "!!!!" . a:2
     else
          let l:line =  a:1 . "!!!!"
     endif
     call add(g:MyItemList, l:line)
endfunction
function! MyItemDump()
        vnew
        nnoremap <silent> <buffer> q :close<cr>
        nnoremap <silent> <buffer> <leader><F8>  :close<cr>
        nnoremap <silent> <buffer>         <F8>  :close<cr>
        let w:scratch = 1
        let l:nn=1
        let l:maxline=-1
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
	for item in g:MyItemList
          let l:szKey   = substitute(item, "!!!!.*", "", "")
          let l:szValue = substitute(item, ".*!!!!", "", "")
          let l:line=l:szKey . repeat(' ', 18-len(l:szKey)) . l:szValue
          call setline(l:nn, l:line)
          let l:nn= l:nn + 1
	endfor
        vertical resize 120 
endfunction
call g:MyItem("My Rememberers")
call g:MyItem("dw",     "delete to the next word")
call g:MyItem("dt,",    "delete up until the next comma on the current line")
call g:MyItem("de",     "delete to the end of the current word")
call g:MyItem("d2e",    "delete to the end of next word")
call g:MyItem("dj",     "delete down a line (current and one below)")
call g:MyItem("dt)",    "delete up until next closing parenthesis")
call g:MyItem("d/rails","delete up until the first search match for 'rails'")
call g:MyItem("-")
call g:MyItem("Main Motions")
call g:MyItem("h,l", "move left/right by character")
call g:MyItem("w", "move forward one (w)ord")
call g:MyItem("b", "move (b)ackward one word")
call g:MyItem("e", "move forward to the (e)nd of a word")
call g:MyItem("-")
call g:MyItem("Motions")
call g:MyItem("()",     "Sentences (delimited words")
call g:MyItem("{}",     "Paragraphs (Next empty line")
call g:MyItem(";",      "Repeat last motion forward")
call g:MyItem(",",      "Repeat last motion backward")
call g:MyItem("<#>G",   "Go to Line #")
call g:MyItem("gg",     "Go to the top of the file")
call g:MyItem("]]",     "Next section (Depending on your current filetype this may move between functions")
call g:MyItem("[[",     "Previous section")
call g:MyItem("0",      "Front of line")
call g:MyItem("^",      "Front of line (first non-blank)")
call g:MyItem("%",      "Matching brace/bracket/paren/tag(with matchtag plugin, see session 3")
call g:MyItem("$",      "End of line")





" *****************************************************************************************************
                                  " Command Words/Aliases
                                  " *******************************************************************
let g:MyKeyMapperMode = "COM " 
call g:MyCommandMapper("command! MI      :call MyItemDump()")
call g:MyCommandMapper("command! RC      :e ~/.vimrc")
call g:MyCommandMapper("command! DOC     :NERDTree /usr/share/vim/vim74/doc")
call g:MyCommandMapper("command! UMOTION :e /usr/share/vim/vim74/doc/motion.txt")
call g:MyCommandMapper("command! USER40  :e /usr/share/vim/vim74/doc/usr_40.txt")
call g:MyCommandMapper("command! U40     :e /usr/share/vim/vim74/doc/usr_40.txt")
call g:MyCommandMapper("command! USER41  :e /usr/share/vim/vim74/doc/usr_41.txt")
call g:MyCommandMapper("command! U41     :e /usr/share/vim/vim74/doc/usr_41.txt")
call g:MyCommandMapper("command! S3PUT :call S3put()")
call g:MyCommandMapper("command! REPOS :call RepoList()")
call g:MyCommandMapper("command! TERMINAL :call Terminal()")
call g:MyCommandMapper("command! TERM :call Terminal()")
call g:MyCommandMapper("command! KSH :call OpenKshTop()")
call g:MyCommandMapper("command! GAWK :call SaveAndExecuteGawk()")
call g:MyCommandMapper("command! COLORLET :call Colorlet(-1)")
call g:MyCommandMapper("command! BE :call SetRegistersBE()")

" Do the static entries here
call g:MyStaticMapper("R", "Execute command, output horozontal")
call g:MyStaticMapper("L", "Execute command, output vertical")

let g:MyKeyMapperMode = "MRU " 
call g:MyStaticMapper("<Enter>","Select a file name to edit") 
call g:MyStaticMapper("o",        "Open file under cursor in new win")
call g:MyStaticMapper("<Sft-Ent>","Open file under cursor in new win")
call g:MyStaticMapper("w","Open a file in  read-only mode")
call g:MyStaticMapper("t","Open a file in a new tab")
call g:MyStaticMapper("u","Refresh MRU list")
call g:MyStaticMapper("q","Close the MRU window")
call g:MyStaticMapper("<Esc>","Close the MRU window")
let g:MyKeyMapperMode = "STD " 
" *****************************************************************************************************
                                  " MJE Polymode Keys
                                  " *******************************************************************
call g:MyKeyMapper("nnoremap <Home> :call PolyMode(-1)<cr>",       "PolyMode On")
call g:MyKeyMapper("nnoremap <End>  :call PolyModeReset()<cr>",    "PolyMode Off")
function! PolyModeMapReset()
          let g:help0 = "<F1> NxtWin <F2> NxtBuf <F3> MRU <F4> NextTab <F5> Cmd <F6> Grep   <F9> PasteMode <F12> Build"
          let g:help1 = ""
          let g:help2 = ""
          let g:MyKeyMapperMode = "STD " 
          call g:MyKeyMapper("nnoremap <F1> <C-W>w:call PolyModeReset()<cr>",     "Next Window")
          call g:MyKeyMapper("nnoremap <F2> :bnext<cr>:call PolyModeReset()<cr>", "Next Buffer")
          call g:MyKeyMapper("nnoremap <F3> :MRU<cr>:call PolyModeReset()<cr>:call BufferLocalF3Quit()<cr>",   "MRU")
          call g:MyKeyMapper("nnoremap <F4> :tabn<cr>",                           "Next Tab")
          call g:MyKeyMapper("nnoremap <F5> :call Tcmd()<cr>",                    "TCmd")
          call g:MyKeyMapper("nnoremap <F6> :call Greppyon()<cr>",                "Greppy First Form, word under cursor")
          call g:MyKeyMapper("nnoremap <F7> :call Greppyon(1)<cr>",               "Greppy Second Form, prompt for word")
          call g:MyKeyMapper("nnoremap <F8> :call MyKeyMapperDump()<cr>",         "MyKeyMapper Help")
          call g:MyKeyMapper("nnoremap <leader><F8> :call MyItemDump()<cr>",      "MyItem Help")
          call g:MyKeyMapper("nnoremap <F9> :set paste!<cr>",                     "Toggle Paste Setting")
          call g:MyKeyMapper("nnoremap <F10> :DOC<cr>",                           "Vim Doc")
          call g:MyKeyMapper("nnoremap <F12> :wa<cr>:!build<cr>",                 "!build")
          call g:MyKeyMapper("nnoremap <silent> <End>  :call PolyModeReset()<cr>","PolyMode Off")
          nnoremap <silent> 1 1
          nnoremap <silent> 2 2
          nnoremap <silent> 3 3
          nnoremap <silent> a a
          nnoremap <silent> b b
          nnoremap <silent> d d
          nnoremap <silent> e e
          nnoremap <silent> f f
          nnoremap <silent> g g
          nnoremap <silent> k k
          nnoremap <silent> m m
          nnoremap <silent> o o
          nnoremap <silent> p p
          nnoremap <silent> O O
          nnoremap <silent> r r
          nnoremap <silent> v v
          nnoremap <silent> s s
          nnoremap <silent> t t
          nnoremap <silent> n n
          nnoremap <silent> <Insert>   <Nop>
          nnoremap <silent> <Right>    <right>
          nnoremap <silent> <Left>     <left>
          nnoremap <silent> <Up>       <up>
          nnoremap <silent> <Down>     <down>
          nnoremap <silent> <PageUp>   <pageup>
          nnoremap <silent> <PageDown> <pagedown>
          nnoremap <silent> <Delete>   <delete>
endfunction
call PolyModeMapReset()


runtime plugin/polymode.vim
if !exists('polymode_loaded')
     echo "Some polymode initializations will be ignored"
else
     call PolyModeZeroMappings()
endif

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
" let NOPOWERLINE = 1
if !exists("NOPOWERLINE")
     set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
     set laststatus=2
     set t_Co=256
endif
" *****************************************************************************************************
                                  " For Status Line
                                  " *******************************************************************
set laststatus=2
set t_Co=256
" *****************************************************************************************************
                                  " Set Color Scheme
                                  " *******************************************************************
colorscheme darkblue
colorscheme pablo
hi Visual   cterm=reverse

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
    setlocal buftype=:1
    nofile
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

function! BufferLocalF3Quit()
        nnoremap <silent> <buffer> <F3> :close<cr>
endfunction

function! RepoList()
        vnew
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
        nnoremap <silent> <buffer> q :close<cr>
        let w:scratch = 1
        vertical resize 80 
        execute "r !curl -s 'https://api.github.com/users/archernar/repos?per_page=100' | grep ssh_url"
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
    execute "silent !gnome-terminal --title=vimsterTerm --geometry 195x50+25+25 &"
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

function! S3put()
    echom   "R cuu -a ECD3 -b ecd3pub -F -c VIMS3PUT -D " . @%
    execute "R cuu -a ECD3 -b ecd3pub -F -c VIMS3PUT -D " . @%
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

function! KillScratchWindows()
        for win in range(1, winnr('$'))
                if getwinvar(win, 'scratch')
                        execute win . 'windo close'
                endif
        endfor
endfunction

function! Redir(cmd)
        for win in range(1, winnr('$'))
                if getwinvar(win, 'scratch')
                        execute win . 'windo close'
                endif
        endfor
        let s:thiscmd= "!" . a:cmd
        if s:thiscmd =~ '^!'
                execute "let output = system('" . substitute(s:thiscmd, '^!', '', '') . "')"
        else
                redir => output
                execute s:thiscmd
                redir END
        endif
        vnew
        let w:scratch = 1
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
        call setline(1, split(output, "\n"))
endfunction


" https://stackoverflow.com/questions/11176159/how-to-jump-to-start-end-of-visual-selection
