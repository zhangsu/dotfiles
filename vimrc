set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'fatih/vim-go'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'wavded/vim-stylus'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

syntax on
filetype plugin indent on

let g:ycm_confirm_extra_conf = 0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore review
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

set t_Co=256
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

colorscheme railscasts
