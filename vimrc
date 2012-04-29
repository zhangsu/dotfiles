syntax on

set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colo railscasts

set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

hi ExtraWhitespace ctermbg=Red guibg=Red
hi Tabs ctermbg=Blue guibg=Blue
hi ColorColumn ctermbg=Red guibg=#212121

au Syntax * syn match ExtraWhitespace /\s\+$/
au Syntax * syn match Tabs /\t\+/

set colorcolumn=80

set guifont=Inconsolata\ 12
