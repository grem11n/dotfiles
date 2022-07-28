"" User Functions
" Create user aliases with arguments
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" Alias for NerdTree
call SetupCommandAlias("nt","NeoTreeRevealToggle")

" Alias for JSON pretty print
call SetupCommandAlias("ppj", "%!python3 -m json.tool")

" Nuake
call SetupCommandAlias("term","Nuake")
