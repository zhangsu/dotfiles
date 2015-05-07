syntax on
filetype plugin indent on

set t_Co=256
let g:ycm_confirm_extra_conf = 0
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore review
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
colorscheme railscasts

set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

highlight ExtraWhitespace ctermbg=Red guibg=Red
highlight Tabs ctermbg=Blue guibg=Blue
highlight Pmenu ctermfg=Black ctermbg=White guifg=#000 guibg=#fff

autocmd BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$', -1)
autocmd BufWinEnter * call matchadd('Tabs', '\t\+', -1)

highlight ColorColumn ctermbg=233 guibg=#212121
set colorcolumn=81,101,121

set guifont=Source\ Code\ Pro\ 10

set sw=2 ts=2 expandtab
set nowrap

if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif

call pathogen#infect()
