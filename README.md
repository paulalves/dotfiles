# dotfiles

```bash
git clone ssh://git@github.com/paulalves/dotfiles.git ~/.dotfiles/

mkdir -p ~/.config/
mkdir -p ~/.nuget/NuGet

ln -s ~/.dotfiles/htop ~/.config/htop
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/dotnet/nuget.config ~/.nuget/NuGet/nuget.config

cp -vf ~/.dotfiles/fonts/NerdFonts/* ~/Library/Fonts/
cp -vf ~/.dotfiles/fonts/Powerline/* ~/Library/Fonts/

pushd ~/.dotfiles/brew 
./brew.sh 
popd 

pushd ~/.dotfiles/mas
./mas.sh 
popd

pushd ~/.dotfiles/dotnet 
./dotnet.sh
popd
```
