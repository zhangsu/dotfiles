set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'digitaltoad/vim-jade'
Plugin 'fatih/vim-go'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'slim-template/vim-slim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'wavded/vim-stylus'

call vundle#end()

syntax on
filetype plugin indent on

set formatoptions-=t

let g:ycm_confirm_extra_conf = 0

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .sass-cache
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore review
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_working_path_mode = 'a'

let g:javascript_plugin_jsdoc = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <silent> <C-O> :FZF<CR>

set visualbell
set t_Co=256
set colorcolumn=81,101,121
set guifont=Source\ Code\ Pro\ 10
set textwidth=0 wrapmargin=0
set sw=2 ts=2 expandtab
set nowrap
set backspace=indent,eol,start
if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
    if $TMUX == ''
      set clipboard=unnamed
    end
  else
    set clipboard=unnamedplus
  endif
endif
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

source $VIMRUNTIME/macros/matchit.vim

" These needs to be before the colorscheme so they get picked up.
highlight Pmenu ctermfg=Black ctermbg=White guifg=#000000 guibg=#ffffff
highlight ColorColumn ctermbg=233 guibg=#212121

colorscheme railscasts

" These needs to be after the colorscheme to prevent them from being
" overriden.
highlight ExtraWhitespace ctermbg=Red guibg=Red
highlight Tabs ctermbg=Blue guibg=Blue

autocmd WinEnter,BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$', -1)
autocmd WinEnter,BufWinEnter * call matchadd('Tabs', '\t\+', -1)
