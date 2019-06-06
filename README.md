# dotfiles
Here is a list of my configuration files.
```
vim         > text editor config
```

## Prerequisites
Obviously, you should install the correspondent software before
using any of the configuration files described in [this list](#dotfiles).

### GNU Stow
I manage my dotfiles with [GNU Stow](https://www.gnu.org/software/stow/),
which is available in most Linux distributions.

For instance, in **Arch** you could install it with `pacman`:
```
sudo pacman -S stow
```
**Note:** This is not necessarily a prerequisite but it makes life easier.

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
LINK: .vim => .dotfiles/vim/.vim
LINK: .vimrc => .dotfiles/vim/.vimrc
WARNING: in simulation mode so not modifying filesystem.
```

## Preview
Here are some screenshots taken from current programs setup.

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
