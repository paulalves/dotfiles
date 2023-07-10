# dotfiles

```bash
git clone ssh://git@github.com/paulalves/dotfiles.git ~/.dotfiles/

ln -s ~/.dotfiles/htop ~/.config/htop
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/alacritty ~/.config/alacritty

cp -vf ~/.dotfiles/NerdFonts/* ~/Library/Fonts/
cp -vf ~/.dotfiles/Powerline/* ~/Library/Fonts/

pushd brew 
./brew.sh 
popd 

pushd mas
./mas.sh 
popd
```
