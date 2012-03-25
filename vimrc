colo koehler
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

hi TrailingSpace ctermbg=red guibg=red
match TrailingSpace /\s\+$/

hi OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength /\%79v.\+/
