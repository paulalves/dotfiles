# dotfiles

```bash
git clone ssh://git@github.com/paulalves/dotfiles.git ~/.dotfiles/

mkdir ~/.config/
mkdir ~/.ssh/
mkdir ~/.dotnet/
mkdir -p ~/.nuget/NuGet

ln -s ~/.dotfiles/htop ~/.config/htop
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/dotnet/nuget.config ~/.nuget/NuGet/nuget.config

ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/paulalves.gitconfig ~/.paulalves.gitconfig
ln -s ~/.dotfiles/git/topo.gitconfig ~/.topo.gitconfig

ln -s ~/.dotfiles/ssh/config ~/.ssh/config
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml

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
