syntax on
filetype plugin indent on

set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme railscasts

set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

highlight ExtraWhitespace ctermbg=Red guibg=Red
highlight Tabs ctermbg=Blue guibg=Blue

autocmd BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$', -1)
autocmd BufWinEnter * call matchadd('Tabs', '\t\+', -1)

highlight ColorColumn ctermbg=233 guibg=#212121
set colorcolumn=80,120

set guifont=Source\ Code\ Pro\ 10

set sw=2 ts=2 expandtab
set nowrap

set clipboard=unnamedplus

call pathogen#infect()
