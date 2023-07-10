# dotfiles

```bash
git clone ssh://git@github.com/paulalves/dotfiles.git ~/.dotfiles/

ln -s ~/.dotfiles/htop ~/.config/htop
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml

cp -vf ~/.dotfiles/fonts/NerdFonts/* ~/Library/Fonts/
cp -vf ~/.dotfiles/fonts/Powerline/* ~/Library/Fonts/

pushd brew 
./brew.sh 
popd 

pushd mas
./mas.sh 
popd
```
