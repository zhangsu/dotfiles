# Su's Dotfiles

Foo.

## Installation

1. [Install NVM](https://github.com/nvm-sh/nvm#installing-and-updating)

2. Run the following commands:

   ```Zsh
   git clone --recursive git@github.com:zhangsu/dotfiles.git
   cd dotfiles
   git submodule update --init --recursive --remote
   rake install_oh_my_zsh  # this also changes the shell
   rake
   ```

## Update submodules

```Zsh
git submodule update --init --recursive --remote
```
