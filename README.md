# dotfiles
Here is a list of my configuration files.
```
audio       > alsa and pulse audio config
awesome     > a dynamic window manager
linters     > configuration for linters (e.g. flake8)
misc        > miscellaneous (e.g. config for curl)
nemo        > file manager
oh-my-zsh   > custom configuration
terminator  > terminal emulator
vim         > text editor config
X11         > X Window System
zsh         > zsh with Oh My Zsh framework
```

## Getting Started
To clone this repository in your home dir and automatically clone all its
included submodules, you could do

1. `cd ~`
2. `git clone --recurse-submodules https://github.com/mchoji/dotfiles`

### GNU Stow
I manage my dotfiles with [GNU Stow](https://www.gnu.org/software/stow/),
which is available in most Linux distributions.

For instance, in **Arch** you could install it with `pacman`:
```
sudo pacman -S stow
```
**Note:** This is not necessarily a prerequisite but it makes life easier.

## Prerequisites
Obviously, you should install the correspondent software before
using any of the configuration files described in [this list](#dotfiles).

Besides, here are specific dependencies and/or important notes about
each program (when needed).

### awesome
This config is basically the same as the original
[worron's awesome-config](https://github.com/worron/awesome-config)
with some personal customization. In order to easily track the updates
from the original repo, I commit my changes in a specific branch.
For more information, please have a look at
[my awesome-config](https://github.com/mchoji/awesome-config).

### zsh
This `zsh` config relies on [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
framework with the following custom theme and plugins:
#### Oh My Zsh custom theme
* [Powerlevel9k](https://github.com/bhilburn/powerlevel9k)

#### Oh My Zsh custom plugins
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-nvm](https://github.com/lukechilds/zsh-nvm)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Manual Installation
Once `stow` is installed, clone this repository into `$HOME`,
`cd` into it and start creating symlinks using `stow` like this:

1. `cd ~`
2. `git clone https://github.com/mchoji/dotfiles.git`
3. `cd dotfiles`
4. `stow vim`

This will symlink `vim`. If you wanna use this configuration for _root_ user, use `-t` argument:
```
stow -t /root vim
```
**Note:** `stow` will only create a symlink if a _config_ file doesn't already exist. You must delete/backup if there is a default _config_ for a program.

**Tip:** If you are unsure about running `stow`, you might use `-n` and
`-v` options together. This will make it run in dry-run mode and show
detailed output. Example:
```
stow -nv vim
```
shows the following in standard output:
```
LINK: .vim => dotfiles/vim/.vim
LINK: .vimrc => dotfiles/vim/.vimrc
WARNING: in simulation mode so not modifying filesystem.
```

## Customization
Whenever possible, I try to keep things organized in such a way
that one could easily add their own preferences on top of mine.

### zsh
For `zsh`, personal configuration can be placed in files like
`.zprofile`, `.functions.local` and `.alias.local`.
See [.gitignore](.gitignore) and [.zshrc](zsh/.zshrc) to check which
files are not included in this repository.

## Preview
Here are some screenshots taken from current programs setup.

### awesome
![awesome](https://raw.githubusercontent.com/mchoji/dotfiles/b63a01c3782ae14588cf0fc7c4ba5c17a3f3a1f7/awesome.png)

### vim
![vim](https://raw.githubusercontent.com/mchoji/dotfiles/a972b2c5c1131fd9e0eb4fa88b7945a0394273bb/vim.png)

### zsh
![zsh](https://raw.githubusercontent.com/mchoji/dotfiles/6194ce0af609e0ef77c6ecc6c692205d1f67f8d8/zsh.png)

## License
This is free and unencumbered software released into the public domain.
See the [LICENSE](LICENSE) file for details.

**Note:** the aforementioned license applies exclusively to my configuration files.
Please refer to the appropriate project's license when using any of
those (_e.g._ [stow](https://www.gnu.org/software/stow/),
[vim](https://www.vim.org/),
[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)).
