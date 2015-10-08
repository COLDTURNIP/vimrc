" --- cscope {
if has("cscope")
  " add any database in current directory                                                                                                                             
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB == ""
    let mysrctop=$R_CODEBASE_TOP
    let mytagpath=$R_CODEBASE_TAG_PATH
    if filereadable(mytagpath."/cscope_c.out")
      au FileType c,cpp exec("cs add ".mytagpath."/cscope_c.out ".mysrctop)
    endif
    if filereadable(mytagpath."/cscope_j.out")
      au Filetype java exec("cs add ".mytagpath."/cscope_j.out ".mysrctop)
    endif
    if filereadable(mytagpath."/cscope.out")
      cs add mytagpath."/cscope.out ".mysrctop
    endif
  endif
endif
"}


" --- ctags {
" add any database in current directory
if filereadable("tags")
    set tag=tags
" else add database pointed to by environment
else
  let mysrctop = $R_CODEBASE_TOP
  if filereadable(mysrctop."/.r_codebase_tags_c")
    au Filetype c,cpp exec("set tag=".mysrctop."/.r_codebase_tags_c")
  endif
  if filereadable(mysrctop."/.r_codebase_tags_j")
    au Filetype java exec("set tag=".mysrctop."/.r_codebase_tags_j ")
  endif
  if filereadable(mysrctop."/tags")
    set tag=mysrctop."/tags"
  endif
endif
"}

