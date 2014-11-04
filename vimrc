" Raphanus's vimrc
" Yun-Chang Lo
" Fork me on GITHUB  https://github.com/COLDTURNIP/vimrc

" read https://github.com/COLDTURNIP/vimrc/blob/master/README.md for more info


" General Settings
set nocompatible   " not compatible with the old-fashion vi mode
set bs=2           " allow backspacing over everything in insert mode
set history=50     " keep 50 lines of command line history
set number         " show line number in default
"set relativenumber" show related line number in default
set ruler          " show the cursor position all the time
set autoread       " auto read when file is changed from outside
set nowrap         " do not wrap lines by default


filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on    " syntax highlight
set hlsearch " search highlighting

set cursorline        " highlight current line
set cursorcolumn      " highlight current column
if has("gui_running")   " GUI color and font settings
  set background=dark
  "set t_Co=256          " 256 color mode
  "colorscheme native
  "colorscheme ir_black
  "colorscheme wombat
  colorscheme gruvbox
  "colorscheme moria

  " font settings {
    if has("win32") || has("win64")
      set gfn=Inconsolata:h11
      set gfw=MinLiU:h11
    elseif has("unix")
      let s:uname = substitute(system("uname -s"), "\n", "", "")
      if (match(s:uname, 'Linux') >= 0)
        set gfn=Monospace\ 9
        set gfw=
      elseif (match(s:uname, 'Darwin') >= 0)
        set gfn=Monaco:h10
        set gfw=
      endif
    endif
  "}
else
" terminal color settings
  set background=dark
  set t_Co=256          " 256 color mode
  "colorscheme xterm16
  "colorscheme native
  "colorscheme ir_black
  "colorscheme wombat256-rfns
  colorscheme gruvbox
  "colorscheme vgod
endif
if v:version >= 703     " show boundary bar at column 80
    set colorcolumn=81
else
    autocmd BufRead,BufNewFile *.txt syntax match Search /\%<82v.\%>81v/
    "autocmd BufRead,BufNewFile *.txt syntax match ErrorMsg /\%>80v.\+/
endif

set clipboard=unnamed                 " yank to the system register (*) by default
set showmode                          " Show current mode
set wildchar=<TAB>                    " start wild expansion in the command line using <TAB>
set wildmenu                          " wild char completion menu
set wildmode=list,full                " list all matches without completing, then each full match
set showmatch                         " Cursor shows matching ) and }
source $VIMRUNTIME/macros/matchit.vim "load smart match plugin

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent               " auto indentation
set smartindent              " smart indentation
set cindent                  " C-style indentation
set incsearch                " incremental search
set nobackup                 " no *~ backup files
set directory=$HOME/.vimswp  " move .swp files to specific directory
set copyindent               " copy the previous indentation on autoindenting
set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab                 " insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" indentation and TAB setting{
  set expandtab        "replace <TAB> with spaces
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4

  au FileType Makefile set noexpandtab

  " show tabs as "»···"
  set listchars=tab:»·,trail:·
  set list

  " settings for specific file types
  "  * ai: auto indent.
  "  * et: replace tabs to spaces.
  "  * sw: set width (for indent).
  "  * ts: tabstop, the width of tab.
  "  * sts: soft tab stop, the width of tab. this set is related to how
  au FileType css,html,javascript,lua,perl,ruby,scala,vim,xml set ai sw=2 ts=2 sts=2
  au FileType python set ai ts=4 sw=4 sts=4 et
  au FileType bash,zsh,sh,shell set ai sw=2 ts=2 sts=2
  au FileType Makefile set ai sw=4 ts=4 sts=4 noet
  au FileType java,vala set ai sw=4 ts=4 sts=4
  au FileType go set ai sw=4 ts=4 sts=4 noet
  " C and C++ sets below. See "C/C++ programming settings" .
"}

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
"---------------------------------------------------------------------------
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
"let mapleader=","
"let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
"nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
"nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <C-h> gT
" go to next tab
map <C-l> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" Ctrl-m turn off search highlighting
nnoremap <silent> <C-m> :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" <leader>p toggles paste mode
nmap <leader>p :set paste!<Bar>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" fast switch indentation between space and tab using ,et
map ,et :set et!<cr>:echo "ExpandTAB="&et<cr>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" convenient scroll
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" auto zz after jump
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap <C-]> <C-]>zz

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------

" Ctrl-[ push tag back to stack (undo Ctrl-t)
noremap <leader><C-]> <ESC>:tag<CR>

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun



" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \   setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif


" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,sjis,gbk,euc-kr,latin1

fun! ViewUTF8()
  set encoding=utf-8
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
  set encoding=big5
  set fileencoding=big5
endfun


"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------


" --- pathogen {
  call pathogen#infect('bundle-pathogen/{}')
"}


" --- EasyMotion {
  let g:EasyMotion_leader_key = ','

  " And other motions in insert mode
  inoremap f <C-Right>
  inoremap b <C-Left>
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-a> <ESC>I
  inoremap <C-e> <End>
  inoremap <C-d> <Del>
  inoremap w <C-Right><C-w>
"}

" --- vim-latex - many latex shortcuts and snippets {
  " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
  " can be called correctly.
  set shellslash
  set grepprg=grep\ -nH\ $*
  " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
  " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
  " The following changes the default filetype back to 'tex':
  let g:tex_flavor='latex'
"}


" --- AutoClose - Inserts matching bracket, paren, brace or quote {
" fixed the arrow key problems caused by AutoClose
  if !has("gui_running")
    "set term=linux
    imap OA <ESC>ki
    imap OB <ESC>ji
    imap OC <ESC>li
    imap OD <ESC>hi

    nmap OA k
    nmap OB j
    nmap OC l
    nmap OD h
  endif
" auto indent after inserting a newline after a brace
  inoremap {<CR> {<CR>}<ESC>O
  "inoremap [<CR> [<CR>]<ESC>O
  "inoremap (<CR> (<CR>)<ESC>O
"}


" --- Command-T {
  let g:CommandTMaxHeight = 15
"}


" --- TagList {
  let Tlist_Ctags_Cmd = 'ctags'
  nnoremap <F12> :TlistToggle<CR>
  autocmd BufWritePost *.rb   :TlistUpdate
  autocmd BufWritePost *.py   :TlistUpdate
  autocmd BufWritePost *.c    :TlistUpdate
  autocmd BufWritePost *.cpp  :TlistUpdate
  autocmd BufWritePost *.java :TlistUpdate
  " Displaying tags for only one file~
  let Tlist_Show_One_File = 1
  " if you are the last, kill yourself
  let Tlist_Exist_OnlyWindow = 1
  " split to the right side of the screen
  let Tlist_Use_Right_Window = 0
  " sort by order or name
  let Tlist_Sort_Type = "name"
  " do not show prototypes and not tags in the taglist window.
  let Tlist_Display_Prototype = 0
  " Remove extra information and blank lines from the taglist window.
  let Tlist_Compart_Format = 0
  " Jump to taglist window on open.
  let Tlist_GainFocus_On_ToggleOpen = 0
  " Show tag scope next to the tag name.
  let Tlist_Display_Tag_Scope = 1
  " Close the taglist window when a file or tag is selected.
  let Tlist_Close_On_Select = 0
  " Don't Show the fold indicator column in the taglist window.
  let Tlist_Enable_Fold_Column = 0
  "let Tlist_WinWidth = 40
"}

" --- YouCompleteMe {
  let g:ycm_path_to_python_interpreter='/usr/bin/python'
  let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"}


" --- Source Explorer {
  "nmap <F5> :SrcExplToggle<CR>
  let g:SrcExpl_winHeight = 8
  let g:SrcExpl_jumpKey = "<ENTER>"
  let g:SrcExpl_pluginList = [
          \ "__Tag_List__",
          \ "_NERD_tree_",
          \ "Source_Explorer"
          \ ]
  let g:SrcExpl_searchLocalDef = 1
  let g:SrcExpl_isUpdateTags = 1
  "let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
  "let g:SrcExpl_updateTagsKey = "<F12>"
"}


" --- Cscope {
if has("cscope")
  set csto=1
  set cst
  set nocsverb

  " Please refer the plugin raphanus_tags for tags autoloading.

"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\><C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\><C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>S :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>G :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>C :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>T :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>E :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\><C-\>F :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\><C-\>I :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\><C-\>D :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
"}


" --- ctags {
  " This part has been moved to plugin raphanus_tags.
"}


" --- Trinity {
  nmap <F4> :TrinityToggleAll<CR>
  nmap <F5> :set hls<Bar>TrinityToggleSourceExplorer<CR>
  "nmap <F6> :TrinityToggleTagList<CR> " duplicated
  nmap <F7> :TrinityToggleNERDTree<CR>
"}


" --- syntastic synctax checker {
  " C++11 support
  if executable("clang++")
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = '--std=c++11 --stdlib=libc++'
    let g:quickrun_config = {}
    let g:quickrun_config['cpp/clang++11'] = {
          \ 'cmdopt': '--std=c++11 --stdlib=libc++',
          \ 'type': 'cpp/clang++'
          \ }
    let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
  endif
" }


" --- Python programming settings {
  " Please install Python compiler before using this command
  autocmd BufRead *.py    map <F9> :!python %<CR>
"}


" --- C/C++ programming settings {
  "autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
  " Related settings should be set in $VIMRUNTIME/indent/{c|cpp}.vim
"}


" --- JavaScript programming settings {
  autocmd BufRead,BufNewFile *.jsm setfiletype javascript
"}


" --- vala programming settings {
  autocmd BufRead,BufNewFile *.vala setfiletype vala
  autocmd BufRead,BufNewFile *.vapi setfiletype vala
  autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
"}

" --- Go programming settings {
  " Read $GOROOT/misc/vim to get more information
  set rtp+=$GOROOT/misc/vim
  autocmd BufRead,BufNewFile *.go setfiletype go
"}

" --- Scala programming settings {
  autocmd BufRead,BufNewFile *.scala setfiletype scala
"}

" --- Smali programming settings {
  autocmd BufRead,BufNewFile *.smali setfiletype smali
"}

" --- Documentation settings {
  " The default behavior of dealing *.md is set filetype to modula2 in
  " $VIMRUNTIME.vim . Hence we need to override it explicitly.
  augroup filetypedetect
    autocmd! BufRead,BufNewFile *.md setfiletype markdown
    autocmd! BufRead,BufNewFile *.markdown setfiletype markdown
  augroup END
"}"

" --- Vundle {
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'derekwyatt/vim-scala'
Plugin 'AutoClose'
Plugin 'Command-T'
Plugin 'EasyMotion'
Plugin 'javacomplete'
Plugin 'matchit.zip'
Plugin 'mediawiki.vim'
Plugin 'Source-Explorer-srcexpl.vim'
Plugin 'surround.vim'
Plugin 'taglist.vim'
Plugin 'trinity.vim'
Plugin 'vimlatex'
Plugin 'VisIncr'
Plugin 'xmledit'
Plugin 'YankRing.vim'

Plugin 'https://github.com/Lokaltog/vim-powerline.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/tpope/vim-markdown.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on
"}

