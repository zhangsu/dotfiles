# Su's Dotfiles

Foo.

## Installation

```Zsh
git clone --recursive git@github.com:zhangsu/dotfiles.git
cd dotfiles
rake
vim +PluginInstall +qall
rake install_ruby_build # optional for rbenv
```

## Update submodules

```Zsh
git submodule update --init --recursive --remote
```
