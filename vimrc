colo koehler
set t_Co=256

hi TrailingSpace ctermbg=red guibg=red
match TrailingSpace /\s\+$/

hi OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength /\%79v.\+/
