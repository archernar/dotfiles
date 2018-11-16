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

" *****************************************************************************************************
                                  " External Environments Variables
                                  " *******************************************************************
" VIM_VIMTIPS                     - Full pathname of the vimtips file
" VIM_COMMANDER                   - Full pathname of the vim commander file
" VIM_PDFLIB                      - Folder name of PDF library
" VIM_S3                          - S3 bucket

set nowrap
set nocompatible
set relativenumber
set hidden                        " Will switch to next buffer without raising an error
set foldcolumn=3
set foldmethod=marker
set foldlevelstart=20
set ruler                         " Display the cursor position on the last line of the screen or in the status line of a window
set number                        " Display line numbers on the left
set wildmenu                      " Better command-line completion
set showcmd                       " Show partial commands in the last line of the screen
set ignorecase                    " Use case insensitive search, except when using capital letters
set smartcase
" set hlsearch incsearch          " Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)
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
command! -nargs=* -complete=shellcmd H new  | let w:scratch = 1 | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
command! -nargs=* -complete=shellcmd V botright 60vnew | let w:scratch = 1 | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
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
                                  " :PluginUpdate     - <leader>p
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
                                  " Utilities 
                                  " *******************************************************************
function! DeSpace()
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"

     execute "%s/^    / /ge"
     execute "%s/^    / /ge"
     execute "%s/^    / /ge"
     execute "%s/^    / /ge"
     execute "%s/^    / /ge"

     execute "%s/^   / /ge"
     execute "%s/^   / /ge"
     execute "%s/^   / /ge"
     execute "%s/^   / /ge"
     execute "%s/^   / /ge"

     execute "%s/^  / /ge"
     execute "%s/^  / /ge"
     execute "%s/^  / /ge"
     execute "%s/^  / /ge"
     execute "%s/^  / /ge"

     execute "%s/^ //ge"
endfunction
function! TrimLeft(s1)
     let l:szPart = substitute(a:s1, "^ *", "", "")
     return l:szPart
endfunction
function! TrimRight(s1)
     let l:szPart = substitute(l:szPart, " *$", "", "")
     return l:szPart
endfunction
function! Trim(s1)
     let l:szPart = substitute(a:s1, "^ *", "", "")
     let l:szPart = substitute(l:szPart, " *$", "", "")
     return l:szPart
endfunction
function! Trimmer(s1,s2)
     let l:szPart = substitute(a:s1,     a:s2,  "", "")
     let l:szPart = substitute(l:szPart, "^ *", "", "")
     let l:szPart = substitute(l:szPart, " *$", "", "")
     return l:szPart
endfunction
function! Pad(s,amt)
        return a:s . repeat(' ',a:amt - len(a:s))
endfunction
function! PrePad(s,amt,...)
        if a:0 > 0
             let char = a:1
        else
             let char = ' '
        endif
        return repeat(char,a:amt - len(a:s)) . a:s
endfunction


function! Test()
     call SetArgs("A","B","D")
endfunction
function! SetArgs(...)
        for i in a:000
            echom i
        endfor
endfunction

" stringToCenter.PadLeft(((totalLength - stringToCenter.Length) / 2) + stringToCenter.Length)


function! CenterPad(...)
        let l:n = (((s:LW-strlen(a:1)) / 2) + strlen(a:1)) - 0
        return PrePad(a:1, l:n)
endfunction
function! Vimtips()
     call LeftWindowFile($VIM_VIMTIPS)
     nnoremap <silent> <buffer> s /^========<cr>zt
     nnoremap <silent> <buffer> d ?^========<cr>zt
     vertical resize 105 
     echom "Vimtips:   use <s> to page forward, <d> to page backward"
endfunction
" *****************************************************************************************************
                                  " MyKeyMapper 
                                  " *******************************************************************
let g:MyKeyList = []
let g:MyValueList = []
let g:MyKeyDict = {} 
let g:MyKeyDictCT = 1000 
let g:MyKeyMapperMode = "STD " 
function! MyTest()
     let l:szKey = "abcd-no"
     let l:szKey = substitute(l:szKey, "^[cga]", "X", "")
     echom l:szKey
endfunction
function! g:MyKeyMapper(...)
     let l:szKey = substitute(a:1, "<silent> ", "", "")
     let l:szKey = substitute(l:szKey, "nnoremap ", "", "")
     let l:szKey = substitute(l:szKey, "vnoremap ", "", "")
     let l:szKey = substitute(l:szKey, "inoremap ", "", "")
     let l:szKey = substitute(l:szKey, " .*$", "", "g")

     let l:prefix = g:MyKeyMapperMode . " " . g:MyKeyDictCT 
     let g:MyKeyDictCT = g:MyKeyDictCT +1
     let g:MyKeyDict[l:prefix . " " . l:szKey] = a:2
     execute a:1
endfunction
function! g:MyCommandMapper(...)
     let l:szCommand = substitute(a:1, "command! ", "", "")
     let l:szCommand = substitute(l:szCommand, '^[A-Z,0-9]*[ ]*',"", "")
     let l:szKey = substitute(a:1, "command! ", "", "")
     let l:szKey = substitute(l:szKey, " .*$", "", "g")

     let l:prefix = g:MyKeyMapperMode . " " . g:MyKeyDictCT 
     let g:MyKeyDictCT = g:MyKeyDictCT +1

     let g:MyKeyDict[l:prefix . " " . l:szKey] = l:szCommand 

     " Insert Command Info into Cheatsheet
     call g:MyCheatsheet(Pad(l:szKey,16)  . "" . l:szCommand)
     call g:MyCommandsheet(Pad(l:szKey,16)  . "" . l:szCommand)

     execute a:1
endfunction
function! g:MyStaticMapper(...)
     let l:prefix = g:MyKeyMapperMode . " " . g:MyKeyDictCT 
     let g:MyKeyDictCT = g:MyKeyDictCT +1

     let g:MyKeyDict[l:prefix . " " . a:1] = a:2
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
function! MyKeyMapperDump(...)
        call LeftWindowBuffer()
        setlocal cursorline
        nnoremap <silent> <buffer> q :close<cr>
        nnoremap <silent> <buffer> ? :close<cr>
        nnoremap <silent> <buffer> <F8>  :call MyKeyMapperDumpSeek()<cr>
        nnoremap <silent> <buffer> <leader><F8>  :close<cr>
        nnoremap <silent> <buffer> s  :call MyKeyMapperDumpSeek()<cr>
        let l:nn=1
"  	for key in sort(keys(g:MyKeyDict))
"                      call setline(l:nn, g:MyKeyDict[key] . "    [[    |" .  key)
"                      let l:nn= l:nn + 1
"  	endfor
	for key in sort(keys(g:MyKeyDict))
          let l:list = split(key)
          let l:section = l:list[0:0]
          let l:number = l:list[1:1]
          let l:punch = l:list[2:2]
          let l:linemod = g:MyKeyDict[key]
          let l:sz = Pad(join(l:section, ''), 8) .  Pad(join(l:punch, '     '),18) . l:linemod

          if ( a:0 == 1)
               if ( l:section == a:1)
                    call setline(l:nn, l:line)
                    let l:nn= l:nn + 1
          endif
          else
               call setline(l:nn, l:sz)
               let l:nn= l:nn + 1
          endif
	endfor
        wincmd H
        vertical resize 80 
        set nowrap
"         setlocal readonly nomodifiable
        echom ""
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
nnoremap <leader>] *
nnoremap <Leader>' diwi""<ESC>hp<ESC>
call g:MyKeyMapper("nnoremap <Leader>nt :NERDTreeToggle<cr>","NERDTree Toggle")
call g:MyKeyMapper("nnoremap <Leader>p  :PluginUpdate<cr>","Vundle Update")
call g:MyKeyMapper("nnoremap <Leader>d  :! rm -rf /tmp/dotfiles;git clone http://github.com/archernar/dotfiles.git /tmp/dotfiles;<cr>","fetch .vimrc update")

call g:MyKeyMapper("nnoremap <leader>ev :split $MYVIMRC<cr>","Split Edit .vimrc")
nnoremap <leader>-  :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>=  :wincmd =<cr>
call g:MyKeyMapper("nnoremap <leader>l :resize -5<cr>","Window Resize +")
call g:MyKeyMapper("nnoremap <leader>m :resize +5<cr>","Window Resize -")
nnoremap <leader>g  :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>h  :silent execute "help " . expand("<cWORD>")<cr> 
nnoremap <leader>w :call Smash()<cr>


" *****************************************************************************************************
                                  " Window and Buffer Splitters
                                  " *******************************************************************
" Window Splits
" nmap <leader>sw<left>  :topleft  vnew<CR>
" nmap <leader>sw<right> :botright vnew<CR>
" nmap <leader>sw<up>    :topleft  new<CR>
" nmap <leader>sw<down>  :botright new<CR>
" Buffer Splits
" nmap <leader>sb<left>   :leftabove  vnew<CR>
" nmap <leader>sb<right>  :rightbelow vnew<CR>
" nmap <leader>sb<up>     :leftabove  new<CR>
" nmap <leader>sb<down>   :rightbelow new<CR>



let g:greppy_mode_active = 0
function! Greppyon(...)
    execute "ccl"
    if a:0 > 0 
         let s:szIn = input('grep for >> ')
         execute "vimgrep /" . s:szIn . "/ %"
         echom "vimgrep /" . s:szIn . "/ %"
    else
         execute "vimgrep /" . expand("<cword>") . "/ %"
         echom "vimgrep /" . expand("<cword>") . "/ %"
    endif
    execute "cw"
    let g:greppy_mode_active = 1
endfunction
function! Greppyoff()
    execute "ccl"
    let g:greppy_mode_active = 0
endfunction
" *****************************************************************************************************
                                  " Things To Learn (TTL)  
                                  " *******************************************************************
let g:MyTTLList = []
function! MyTTLDump()
        call LeftWindowBuffer()
        nnoremap <silent> <buffer> q :close<cr>
        let l:nn=1
        call setline(l:nn, CenterPad("Things to Learn"))
        let l:nn=2
	for l:item in g:MyTTLList
          call setline(l:nn, l:item)
          let l:nn= l:nn + 1
	endfor
        vertical resize 120 
endfunction
" *****************************************************************************************************
                                  " MyCommandsheet 
                                  " *******************************************************************
let g:MyCommandsheetList = []
function! g:MyCommandsheet(...)
     call add(g:MyCommandsheetList, a:1)
endfunction
function! MyCommandsheetDump()
        nnoremap <silent> <buffer> q :close<cr>
        let l:nn=1
        let l:new_list = deepcopy(g:MyCommandsheetList)
        call sort(l:new_list)
	for item in l:new_list
          call setline(l:nn, item)
          let l:nn= l:nn + 1
	endfor
        vertical resize 120 
        setlocal readonly nomodifiable
endfunction
" *****************************************************************************************************
                                  " MyCheatsheet 
                                  " if (l:szCommand[0:0] == "!")
                                  " *******************************************************************
let g:MyQuickList = []
let g:MyCheatsheetList = []
function! MyCheatsheetEnter()
     let l:szLine  = getline(".")
     let l:szKey   = substitute(l:szLine, " .*", "", "")
     if ( l:szKey == "COM")
         let l:szValue = substitute(l:szLine, "COM *", "", "")
         let l:szValue = substitute(l:szValue, ">>.*", "", "")
         echom l:szValue
         execute "normal q"
         execute l:szValue
     endif
     if ( l:szKey == "TXT")
         let l:szValue = substitute(l:szLine, "TXT *", "", "")
         let l:szValue = substitute(l:szValue, ">>.*", "", "")
         call cursor(1, 1)
         execute "normal! gg"
         execute "normal! dG"
         execute "r " . l:szValue
         echom l:szValue[0:3]
         setlocal nocursorline
     endif
     if ( l:szKey == "PDF")
         let l:szValue = substitute(l:szLine, "PDF *", "", "")
         let l:szValue = substitute(l:szValue, ">>.*", "", "")
         echom l:szValue
         execute "silent !xdg-open " . l:szValue . " >/dev/null 2>&1"
         execute "redraw!"
         execute "normal q"
         setlocal nocursorline
     endif
     if ( l:szKey == "MP3")
         let l:szValue = substitute(l:szLine, "MP3 *", "", "")
         let l:szValue = substitute(l:szValue, ">>.*", "", "")
         echom l:szValue
         execute "silent !xdg-open " . l:szValue . " >/dev/null 2>&1"
         execute "redraw!"
         execute "normal q"
         setlocal nocursorline
     endif
     if ( l:szKey[0:3] == "URL")
         let l:szValue = substitute(l:szLine, "URL *", "", "")
         let l:szValue = substitute(l:szValue, ">>.*", "", "")
         echom l:szValue
         execute "silent !xdg-open " . l:szValue . " >/dev/null 2>&1"
         execute "redraw!"
         execute "normal q"
     endif

endfunction
function! g:QLA(...)
           call add(g:MyQuickList, a:1)
endfunction
function! g:QuickListAdd(...)
           call add(g:MyQuickList, a:1)
endfunction


function! g:CS(...)
     if ( a:0 == 1)
          let l:a2 = ""
     endif
     if ( a:0 == 2)
          let l:a2 = a:2
     endif
     let l:line =  a:1 . " ,,, " . l:a2 . "!!!!@@@@"
     call add(g:MyCheatsheetList, l:line)
endfunction

function! g:TTL(...)
     if ( a:0 == 1)
          call add(g:MyTTLList, a:1)
     endif
endfunction

function! g:TTL2(...)
     if ( a:0 == 1)
          let l:a2 = ""
     endif
     if ( a:0 == 2)
          let l:a2 = a:2
     endif
     let l:line =  a:1 . " ,,, " . l:a2 . "!!!!@@@@"
     call add(g:MyCheatsheetList, l:line)
     call add(g:MyTTLList, l:line)
endfunction


" function! g:CS(...)
"      if ( a:0 == 1)
"           let l:a2 = ""
"      endif
"      if ( a:0 == 2)
"           let l:a2 = a:2
"      endif
"      let l:line =  a:1 . " ,,, " . l:a2 . "!!!!@@@@"
"      call add(g:MyCheatsheetList, l:line)
" endfunction
function! g:CS1(...)
     for i in a:000
          let l:line =  i . "!!!!@@@@"
          call add(g:MyCheatsheetList, l:line)
     endfor
endfunction
function! g:CS2(p1,p2)
     let l:line =  a:p1 . "!!!!" . a:p2 ."@@@@"
     call add(g:MyCheatsheetList, l:line)
endfunction
function! g:CS3(p1,p2,p3)
     let l:line =  a:p1 . "!!!!" . a:p2 . "@@@@>>" . a:p3
     call add(g:MyCheatsheetList, l:line)
endfunction
function! g:MyCheatsheet(...)
     if ( a:0 == 3)
           let l:line =  a:1 . "!!!!" . a:2 . "@@@@>>" . a:3
     endif
     if ( a:0 == 2)
          let l:line =  a:1 . "!!!!" . a:2 ."@@@@"
     endif
     if ( a:0 == 1)
          let l:line =  a:1 . "!!!!@@@@"
     endif
     call add(g:MyCheatsheetList, l:line)
endfunction
function! MyQuickListDump()
        call LeftWindowBuffer()
        nnoremap <silent> <buffer> q :close<cr>
        nnoremap <silent> <buffer> <F10> :close<cr>
        let l:nn=1
	for item in g:MyQuickList
             call setline(l:nn, item)
             let l:nn= l:nn + 1
	endfor
        vertical resize 120 
endfunction

function! MyCheatsheetDump()
        call LeftWindowBuffer()
        nnoremap <silent> <buffer> q :close<cr>
        nnoremap <silent> <buffer> <F10> :close<cr>
        let l:nn=1
	for item in g:MyCheatsheetList
          let l:szKey   = substitute(item, "!!!!.*", "", "")
          let l:szDesc  = substitute(item, ".*@@@@", "", "")
          let l:szValue = substitute(item, ".*!!!!", "", "")
          let l:szValue  = substitute(l:szValue, "@@@@.*", "", "")

          if (l:szValue == "" )
               let l:n = match(l:szKey,',,,')
               if (l:n > 0 )
                    let l:szPart1 = strpart(l:szKey, 0, n)
                    let l:szPart2 = strpart(l:szKey, n)
                    let l:szPart1 = Trimmer(l:szPart1, ",,," )
                    let l:szPart2 = Trimmer(l:szPart2, ",,," )
                    let l:line=Pad(l:szPart1,(s:LW/2)-3) . " | " . l:szPart2
               else
                    let l:line=l:szKey
               endif
          else
               let l:line=l:szKey . repeat(' ', 6-len(l:szKey)) . l:szValue . repeat('%', 52-len(l:szValue)) . l:szDesc
          endif
          let l:n = match(l:line,'-------')
          if (l:n == -1 )
               let l:line = strpart(l:line, 0, s:LW-2)
          endif
          call setline(l:nn, l:line)
          let l:nn= l:nn + 1
	endfor
        vertical resize 120 
        nnoremap <silent> <buffer> <Enter> :call MyCheatsheetEnter()<cr>
"       setlocal readonly nomodifiable
endfunction
let s:LW = 110
let s:barline = repeat('-', s:LW)
" *****************************************************************************************************
                                  " TTL Items
                                  " *******************************************************************
call g:TTL("zt   puts current line to top of screen")
call g:TTL("z.   puts current line to center of screen ")
call g:TTL("zz   puts current line to center of screen ")
call g:TTL("zb   puts current line to bottom of screen")
call g:TTL("y$   yank till the end of line")
call g:TTL("ys<motion><char>   Surround")
call g:TTL("yss<char>          Surround current line")
call g:TTL("VMODE S<char>      Surround current selection")




" *****************************************************************************************************
                                  " My Cheat Sheet Items
                                  " *******************************************************************
call g:MyCheatsheet(CenterPad(""))
call g:MyCheatsheet(CenterPad("My Cheat Sheet"))
call g:MyCheatsheet(CenterPad(" "))
call g:MyCheatsheet(s:barline)


call g:MyCheatsheet(CenterPad("Plaintext Text Objects - Words"))
call g:MyCheatsheet(CenterPad("<number><command><text object or motion>"))
call g:CS("aw   a word (with white space)",           "iw   inner word")
call g:CS("ab   a block from [( to ]) (with braces)", "ib   inner block")
call g:CS("ap   a paragraph (with white space)",      "ip   inner paragraph")
call g:CS("as   a sentence (with white space)",       "is   inner sentance")
call g:CS("at   a tag block (with white space)",      "it   inner tag")

call g:CS("a\"   double quoted string",               "i\"   double quoted string without the quotes")
call g:CS("a\'   single quoted string",                "i\'   single quoted string without the quotes")


call g:MyCheatsheet(s:barline)
call g:MyCheatsheet("zt  puts current line to top of screen             ,,,    z. or zz puts current line to center of screen")
call g:MyCheatsheet("zb  puts current line to bottom of screen          ,,,")
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet("i   Enter insert mode at cursor                    ,,,    I   Enter insert mode at first non-blank char")
call g:MyCheatsheet("s   Delete char under cursor enter i-mode          ,,,    S   Delete line & insert @ begin of same line")
call g:MyCheatsheet("a   Enter insert mode _after_ cursor               ,,,    A   Enter insert mode at the end of the line")
call g:MyCheatsheet("o   Enter insert mode on the next line             ,,,    O   rEenter insert mode on the above line")
call g:MyCheatsheet("C   Delete from cursor to EOL & begin insert       ,,,")
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet("dw  delete to the next word                        ,,,    dt  delete until next comma on the curline")
call g:MyCheatsheet("de  delete to the end of the current word          ,,,    d2e delete to the end of next word")
call g:MyCheatsheet("dj  delete down a line (current and one below      ,,,    dt) delete up until next closing parenthesis")
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet("                     d/rails delete up until the first of 'rails'")
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet(CenterPad("Motions"))
call g:MyCheatsheet("h,l  move left/right by character                  ,,,    w   move forward one (w)ord")
call g:MyCheatsheet("b    move (b)ackward one word                      ,,,    e   move forward to the (e)nd of a word")
call g:MyCheatsheet("aw   a word (surrounding white space)              ,,,    iw  inner word (not surrounding white space)")
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet("()    Sentences (delimited words)                  ,,, {}   Paragraphs (Next empty line)")
call g:MyCheatsheet(";     Repeat last motion forward                   ,,, ,    Repeat last motion backward")
call g:MyCheatsheet("<#>G  Go to Line #                                 ,,, gg   Go to the top of the file")
call g:MyCheatsheet("]]    Next section                                 ,,, [[   Previous section")
call g:MyCheatsheet("0     Front of line                                ,,, ^    Front of line (first non-blank)")
call g:MyCheatsheet("%     Matching brace/bracket/paren/tag             ,,, $    End of line")

call g:MyCheatsheet(CenterPad("Variable Scope"))
call g:MyCheatsheet("nothing      In a function: local to a function; otherwise: global")
call g:MyCheatsheet("buffer  b:   Local to the current buffer           ,,,window   w:   Local to the current window")
call g:MyCheatsheet("vim     v:   Global, predefined by Vim             ,,,tabpage  t:   Local to the current tab page")
call g:MyCheatsheet("global  g:   Global                                ,,,local    l:   Local to a function")
call g:MyCheatsheet("script  s:   Local to |:src|'ed Vim script         ,,,fun-arg  a:   Function argument (inside a function)")
call g:MyCheatsheet(s:barline)

call g:MyCheatsheet(CenterPad("Commands"))
call g:MyCheatsheet("COM", "call CommanderList()")
call g:MyCheatsheet("COM", "call CommanderListEdit()")
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet(CenterPad("Documents"))
call g:MyCheatsheet("PDF","~/pdfs/vim-sq.pdf", "The Vim Tutorial and Reference")
call g:MyCheatsheet("PDF","~/vimdocs/gnuplot4_6.pdf", "GnuPlot 4.6 Documentation")
call g:MyCheatsheet("PDF","~/vimdocs/progit.pdf","Pro Git Book")
call g:MyCheatsheet("PDF","~/vimdocs/SpringBootInAction.pdf")
call g:MyCheatsheet("TXT","/usr/share/vim/vim74/doc/motion.txt","VIM Doc")
call g:MyCheatsheet("TXT","/usr/share/vim/vim74/doc/pattern.txt")
call g:MyCheatsheet("TXT","/usr/share/vim/vim74/doc/usr_27.txt")
call g:MyCheatsheet("TXT","/usr/share/vim/vim74/doc/usr_40.txt")
call g:MyCheatsheet("TXT","/usr/share/vim/vim74/doc/usr_41.txt","Write a VIM Script")
call g:MyCheatsheet("URL","https://www.youtube.com/watch?v=XA2WjJbmmoM","How to Do 90% of What Plugins Do (With Just Vim)")
call g:MyCheatsheet("URL","https://devhints.io/vimscript-functions","VimScript Functions")
call g:MyCheatsheet("URL","https://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/","spliting the way you want")

call g:MyCheatsheet(s:barline)

" *****************************************************************************************************
                                  " Command Words/Aliases
                                  " *******************************************************************
call g:MyCheatsheet(s:barline)
call g:MyCheatsheet(CenterPad("My Commands"))
let g:MyKeyMapperMode = "COM " 
call g:MyCommandMapper("command! CHEAT   :call MyCheatsheetDump()")
call g:MyCommandMapper("command! MI      :call MyCheatsheetDump()")
call g:MyCommandMapper("command! RC      :e ~/.vimrc")
call g:MyCommandMapper("command! DOC     :NERDTree /usr/share/vim/vim74/doc")
call g:MyCommandMapper("command! LIB     :call PDFList()")
call g:MyCommandMapper("command! PDF     :call PDFList()")
call g:MyCommandMapper("command! MP3     :call MP3List()")
call g:MyCommandMapper("command! UMOTION :e /usr/share/vim/vim74/doc/motion.txt")
call g:MyCommandMapper("command! USER40  :e /usr/share/vim/vim74/doc/usr_40.txt")
call g:MyCommandMapper("command! U40     :e /usr/share/vim/vim74/doc/usr_40.txt")
call g:MyCommandMapper("command! USER41  :e /usr/share/vim/vim74/doc/usr_41.txt")
call g:MyCommandMapper("command! U41     :e /usr/share/vim/vim74/doc/usr_41.txt")
call g:MyCommandMapper("command! U27     :e /usr/share/vim/vim74/doc/usr_27.txt")
call g:MyCommandMapper("command! S3PUT :call S3put()")
call g:MyCommandMapper("command! C       :call CommanderList()")
call g:MyCommandMapper("command! CE      :call CommanderListEdit()")

call g:MyCommandMapper("command! TEST    :echom Trim('    Hello Jane  3  ,,,  eee    ')")

call g:MyCommandMapper("command! XXCSD   :call CallMan('LeftWindowBuffer()', 'MyCommandsheetDump()')")
call g:MyCommandMapper("command! CSD     :call XMan('botright new', 'MyCommandsheetDump()')")

call g:MyCommandMapper("command! SNIPS   :topleft vnew ~/snips.java")
call g:MyCommandMapper("command! REPOS   :call RepoList()")
call g:MyCommandMapper("command! FOUR    :call Four()")
call g:MyCommandMapper("command! GETVUNDLE     :!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
call g:MyCommandMapper("command! TIPS    :call Vimtips()")
call g:MyCommandMapper("command! VT      :call Vimtips()")
call g:MyCommandMapper("command! TERM    :call Terminal()")
call g:MyCommandMapper("command! KSH     :call KshTop()")
call g:MyCommandMapper("command! GAWK    :call SaveAndExecuteGawk()")
call g:MyCommandMapper("command! COLORLET :call Colorlet(-1)")
call g:MyCommandMapper("command! BE :call SetRegistersBE()")

call g:MyCommandMapper("command! KALL     :call MyKeyMapperDump()")
call g:MyCommandMapper("command! KSTD     :call MyKeyMapperDump('STD')")
call g:MyCommandMapper("command! KCOM     :call MyKeyMapperDump('COM')")
call g:MyCommandMapper("command! KMRU     :call MyKeyMapperDump('MRU')")
call g:MyCommandMapper("command! KPOLY    :call MyKeyMapperDump('POLY')")
call g:MyCommandMapper("command! DARKBLUE :colorscheme darkblue")
call g:MyCommandMapper("command! MYCOLOR  :colorscheme pablo")
call g:MyCommandMapper("command! PABLO    :colorscheme pablo")
call g:MyCommandMapper("command! BLUE     :colorscheme blue")
call g:MyCommandMapper("command! SLATE    :colorscheme slate")
call g:MyCommandMapper("command! RON      :colorscheme ron")
call g:MyCommandMapper("command! DESERT   :colorscheme desert")
call g:MyCommandMapper("command! SHINE    :colorscheme shine")
call g:MyCommandMapper("command! EVENING  :colorscheme evening")

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
                                  " Polymode Keys
                                  " *******************************************************************
call g:MyKeyMapper("nnoremap <Home> :call PolyMode(-1)<cr>",       "PolyMode On")
call g:MyKeyMapper("nnoremap <End>  :call PolyModeReset()<cr>",    "PolyMode Off")
function! PolyModeMapReset()
          let g:help0 = "<F1> NxtWin <F2> NxtBuf <F3> MRU <F4> Commander <F5> Cmd <F6> Grep <F9> PasteMode <F10> Cheat/Doc <F12> Build -- <S-F1> TTL"
          let g:help1 = ""
          let g:help2 = ""
          let g:MyKeyMapperMode = "STD " 
"           TEST     TEST      TEST
"           TEST     TEST      TEST
"           TEST     TEST      TEST
"           TEST     'TEST      TEST'
"           TEST     TEST      TEST
          call g:MyKeyMapper("inoremap jj <esc>",                                 "Escape ReMapped",1)
          call g:MyKeyMapper("nnoremap <F1> <C-W>w:call PolyModeReset()<cr>",     "Next Window")
          call g:MyKeyMapper("nnoremap <leader><F1> :call MyTTLDump()<cr>",       "My Help",1)
          call g:MyKeyMapper("nnoremap <F2> :bnext<cr>:call PolyModeReset()<cr>", "Next Buffer")
          call g:MyKeyMapper("nnoremap <F3> :MRU<cr>:call PolyModeReset()<cr>:call BufferLocalF3Quit()<cr>",   "MRU")
          call g:MyKeyMapper("nnoremap <F4> :C<cr>",                              "Commander")
          call g:MyKeyMapper("nnoremap <F5> :call Tcmd()<cr>",                    "TCmd")
          call g:MyKeyMapper("nnoremap <F6> :call Greppyon()<cr>",                "Greppy First Form, word under cursor")
          call g:MyKeyMapper("nnoremap <F7> :call Greppyon(1)<cr>",               "Greppy Second Form, prompt for word")
          call g:MyKeyMapper("nnoremap <F8> :call MyKeyMapperDump()<cr>",         "MyKeyMapper Help")
          call g:MyKeyMapper("nnoremap <leader><F8> :call MyCheatsheetDump()<cr>","My Cheatsheet")
          call g:MyKeyMapper("nnoremap <F9> :set paste!<cr>",                     "Toggle Paste Setting")
          call g:MyKeyMapper("nnoremap <leader><F9> :call MyQuickListDump()<cr>", "My QuickList")
          call g:MyKeyMapper("nnoremap <F10> :CHEAT<cr>",                         "My Cheat Sheet")
          call g:MyKeyMapper("nnoremap <leader><F10> :DOC<cr>",                   "Vim Doc")
          call g:MyKeyMapper("nnoremap <F12> :wa<cr>:!build<cr>",                 "!build")
          " call g:MyKeyMapper("nnoremap <leader><F12> lmaj0d$`ahp`ah",             "grabandtuck")
          call g:MyKeyMapper("nnoremap <leader><F12> lmaj0:s/^ *//<cr>0:s/ *$//<cr>0d$`ahpj0dd",            "grabandtuck")
          call g:MyKeyMapper("nnoremap <leader>` ys$\`",               "surround till EOL")
          call g:MyKeyMapper("nnoremap <silent> <End>  :call PolyModeReset()<cr>","PolyMode Off")
          " Window
          call g:MyKeyMapper("nnoremap <leader>sw<left>  :topleft  vnew<CR>","Split Window Left")
          call g:MyKeyMapper("nnoremap <leader>sw<right> :botright vnew<CR>","Split Window Right")
          call g:MyKeyMapper("nnoremap <leader>sw<up>    :topleft  new<CR>","Split Window Up")
          call g:MyKeyMapper("nnoremap <leader>sw<down>  :botright new<CR>","Split Window Down")
          " Buffer  
          call g:MyKeyMapper("nnoremap <leader>sb<left>  :leftabove  vnew<CR>","Split Buffer Left")
          call g:MyKeyMapper("nnoremap <leader>sb<right> :rightbelow vnew<CR>","Split Buffer Right")
          call g:MyKeyMapper("nnoremap <leader>sb<up>    :leftabove  new<CR>","Split Buffer Up")
          call g:MyKeyMapper("nnoremap <leader>sb<down>  :rightbelow new<CR>","Split Buffer Down")
          call g:MyKeyMapper("nnoremap <leader>kb<down>  :bdelete!<CR>","Buffer Delete")
          " Close  
          call g:MyKeyMapper("nnoremap <leader>c  :close<CR>","Close Window")
          call g:MyKeyMapper("nnoremap <leader>q  :quit<CR>","Close Window")
          " Visual Mode  
          call g:MyKeyMapper("vnoremap <silent> <End> y:call BottomBuffer('~/snips.java')<cr>:set paste<cr>G$a<cr>===<cr>===<cr><esc>pG$a<cr><esc>:w<cr>:set nopaste<cr>","snip")
          nnoremap <silent> 1 1
          nnoremap <silent> 2 2
          nnoremap <silent> 3 3
          nnoremap <silent> a a
          nnoremap <silent> b b
          nnoremap <silent> d d
          nnoremap <silent> e e
          nnoremap <silent> f f
          nnoremap <silent> g g
          nnoremap <silent> h h
          nnoremap <silent> j j
          nnoremap <silent> k k
          nnoremap <silent> l l
          nnoremap <silent> m m
          nnoremap <silent> o o
          nnoremap <silent> p p
          nnoremap <silent> q q
          nnoremap <silent> O O
          nnoremap <silent> r r
          nnoremap <silent> v v
          nnoremap <silent> s s
          nnoremap <silent> t t
          nnoremap <silent> n n
          nnoremap <silent> w w
          nnoremap <silent> ? ?
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
     autocmd FileType qf resize 25 
     autocmd FileType qf nnoremap <silent> <buffer> q :ccl<cr



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
                                  " Utility Functions
                                  " *******************************************************************
function! CallMan(...)
     execute "call " . a:1
     execute "call " . a:2
endfunction
function! CallMan3(...)
     execute "call " . a:1
     execute "call " . a:2
     execute "call " . a:3
endfunction
function! XMan(...)
     let l:pre = ""
     let l:x = 1
     let l:n = match(a:(l:x), '(')
     if (l:n > 0 )
          let l:pre = "call "
     endif
     execute l:pre . a:1

     let l:pre = ""
     let l:n = match(a:2, '(')
     if (l:n > 0 )
          let l:pre = "call "
     endif
     execute l:pre . a:2
endfunction

function! ExeMan(...)
     execute "" . a:1
     execute "" . a:2
endfunction
function! ExeMan3(...)
     execute "" . a:1
     execute "" . a:2
     execute "" . a:3
endfunction


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
function! Four() 
    new | vnew | wincmd w | wincmd w | vnew 
endfunction

function! SaveAndExecutePython()
    " https://stackoverflow.com/questions/18948491/running-python-code-in-vim
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim
    call MakeTempBuffer()

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)
    setlocal readonly nomodifiable
    wincmd k
endfunction


function! Tcmd()
    call SetRegisterI()
    let l:cWord = @i
    silent execute "update | edit"
    call MakeTempBuffer()

    let l:szCommand = ".!" .  l:cWord
    silent execute  l:szCommand

    setlocal readonly nomodifiable

endfunction

function! BufferLocalF3Quit()
        nnoremap <silent> <buffer> <F3> :close<cr>
endfunction
   
" *****************************************************************************************************
                                  " Repo List Functions
                                  " *******************************************************************
function! RepoList()
        call LeftWindowBuffer("", "r !curl -s 'https://api.github.com/users/archernar/repos?per_page=100' | grep ssh_url")
endfunction
" *****************************************************************************************************
                                  " Commander Functions
                                  " *******************************************************************
function! CommanderEnterAction()
     let l:szKey = substitute(getline("."), " .*$", "", "g")
     let l:szCommand = substitute(getline("."), "^[a-z]* ", "", "")
     let l:szCommand = substitute(l:szCommand, "^[ ]*", "", "")
     execute "1"
     execute "normal! gg"
     execute "normal! dG"
     if (l:szCommand[0:0] == "!")
          silent execute "r " . l:szCommand
     else
          silent execute l:szCommand
     endif
     execute "nnoremap <silent> <buffer> <Enter> <Nop>"
endfunction
function! CommanderList()
    call LeftWindowBuffer(":call CommanderEnterAction()<cr>", "r !cat " . $VIM_COMMANDER)
endfunction
function! CommanderListEdit()
    silent execute  "e " . $VIM_COMMANDER
endfunction

" *****************************************************************************************************
                                  " PDF View Functions
                                  " *******************************************************************
function! ListEnterAction()
     let currentLine   = getline(".")
     echom currentLine
     execute "silent !xdg-open " . currentLine . " >/dev/null 2>&1"
     execute "redraw!"
     setlocal readonly nomodifiable
endfunction
function! PDFList()
          call LeftWindowBuffer(":call ListEnterAction()<cr>", "r !ls " . $VIM_PDFLIB . "/*.pdf")
endfunction
function! MP3List()
          call LeftWindowBuffer(":call ListEnterAction()<cr>", "r !ls " . $VIM_MP3LIB . "/*.mp3")
endfunction

" *****************************************************************************************************
                                  " Utility Functions
                                  " *******************************************************************
function! DQ(...)
    let l:sz = substitute(a:1, "<cr>", "", "g")
    let l:sz = substitute(l:sz, ":", "", "g")
    return "\'" . l:sz . "\'"
endfunction
" *****************************************************************************************************
                                  " Left Window-Buffer Functions
                                  " *******************************************************************
function! LeftWindowFile(...)
        execute "vnew " . a:1
        wincmd H
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile readonly nomodifiable | nnoremap <silent> <buffer> q :close<cr>
        let w:scratch = 1
        vertical resize 80 
        call cursor(1, 1)
endfunction
function! BottomBuffer(...)
        execute "rightbelow new " . a:1
        call cursor(1, 1)
endfunction
function! LeftWindowBuffer(...)
    " a:1    Enter Action
    " a:2    Content Action
    " *******************************************************************
    " Reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        vnew
        wincmd H
        let s:buf_nr = bufnr('%')
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
        nnoremap <silent> <buffer> q :close<cr>
    elseif bufwinnr(s:buf_nr) == -1
        vnew
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif
    " *******************************************************************
    if ( a:0 > 0)
         execute "nnoremap <silent> <buffer> <Enter> " . a:1
    endif
    " let w:scratch = 1
    vertical resize 80 
    call cursor(1, 1)
    execute "normal! gg"
    execute "normal! dG"
    if ( a:0 > 0)
         execute a:2
    endif
    call cursor(1, 1)
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
     setlocal readonly nomodifiable
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




function! SetRegisterI()
      let szIn = input('$ ')
      let @i = szIn
      echo "\r"
      echo ""
endfunction
function! Terminal()
    execute "silent !gnome-terminal --title=vimsterTerm --geometry 195x50+25+25 &"
    redraw!
endfunction

" *****************************************************************************************************
                                  " KSH Topper Functions
                                  " *******************************************************************
function! TopPut(...)
    call append(line('0'), a:1)
endfunction
function! KshTop()
    call TopPut("")
    call TopPut("trap \"exit 2\" 1 2 3 13 15")
    call TopPut("trap 'rm -f \"$Tmp\" >/dev/null 2>&1' 0")
    call TopPut("TmpDir=\"/tmp/dir$$\"")
    call TopPut("Tmp=\"/tmp/$$\"")
    call TopPut("#!/usr/bin/ksh")
endfunction

function! S3put()
    echom   "R cuu -a  -b ecd3pub -F -c VIMS3PUT -D " . @%
    execute "R cuu -a  -b ecd3pub -F -c VIMS3PUT -D " . @%
endfunction

function! SaveAndExecuteGawk()
    let s:current_buffer_file_path = expand("%")
    silent execute "update | edit"
    call MakeTempBuffer()
    silent execute ".!gawk -f " . shellescape(s:current_buffer_file_path, 1) . " input.txt"
    setlocal readonly nomodifiable
endfunction

" *****************************************************************************************************
                                  " Jump to Last Position When Reopening a File
                                  " *******************************************************************
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
"
"
" Swap window buffers.
" function! SwapWindowBuffers()
"     if !exists("g:markedWinNum")
"         " set window marked for swap
"         let g:markedWinNum = winnr()
"         :echo "window marked for swap"
"     else
"         " mark destination
"         let curNum = winnr()
"         let curBuf = bufnr( "%" )
"         if g:markedWinNum == curNum
"             :echo "window unmarked for swap"
"         else
"             exe g:markedWinNum . "wincmd w"
"             " switch to source and shuffle dest->source
"             let markedBuf = bufnr( "%" )
"             " hide and open so that we aren't prompted and keep history
"             exe 'hide buf' curBuf
"             " switch to dest and shuffle source->dest
"             exe curNum . "wincmd w"
"             " hide and open so that we aren't prompted and keep history
"             exe 'hide buf' markedBuf
"             :echo "windows swapped"
"         endif
"         " unset window marked for swap
"         unlet g:markedWinNum
"     endif
" endfunction
" 
" noremap <F10> :call SwapWindowBuffers()<CR>
