# Dotfiles

I'm managing my dotfiles and some setup configurations here =)

## WSL
To use Arch in WSL:
1. Download [ArchWSL](https://github.com/yuk7/ArchWSL)
2. Extract to C:/Arch
3. `cd` into C:/Arch and execute Arch.exe
4. Reopen Windows Terminal and setup Arch as default
5. Follow ArchWSL docs to setup the default user
```bash
$ echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
$ useradd -m -G wheel -s /bin/bash {username}
$ passwd {username}

# On windows
Arch.exe config --default-user {username}
```
6. Initialize keyring
```bash
$ sudo pacman-key --init
$ sudo pacman-key --populate
$ sudo pacman -Sy archlinux-keyring
$ sudo pacman -Su
```
7. Theming Windows Terminal with [this](https://windowsterminalthemes.dev/)
8. Install [yay](https://github.com/Jguer/yay) as AUR helper

## Terminal

I'll be using Zsh with [powerlevel10k](https://github.com/romkatv/powerlevel10k).

```bash
# installing zsh
$ yay -S zsh

# setting zsh as default shell
$ chsh -s /usr/bin/zsh

# installing powerlevel10k
# remember to install a nerd font such as meslolgs and set as default font on windows terminal
$ yay -S --noconfirm zsh-theme-powerlevel10k-git

# auto-suggestion plugin for zsh
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# helper tools that i use to override cat and ls commands at .zshrc later on
$ cargo install bat exa

# installing asdf
$ yay -S asdf-vm
$ source /opt/asdf-vim/asdf.sh

# installing tmuxinator
$ gem install tmuxinator
```

## Get dotfiles and add symbolic links
```bash
git clone https://github.com/leonardodimarchi/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.tmux.conf
ln -s ~/.dotfiles/lvim ~/.config/lvim
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

## References

- [Akita's setup with ArchWSL](https://www.youtube.com/watch?v=sjrW74Hx5Po)
- [If Coding Was Natural - Lunarvim config](https://github.com/IfCodingWereNatural/minimal-nvim/tree/lunarvim)
