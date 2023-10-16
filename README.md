# dotfiles

Help for makefile

```bash
make help
```
Output: 
```
Usage: make [target]

Targets:

  all: Installs all formulas, casks, fonts, app store apps and configs
  brew-setup: Installs brew if not installed
  brew-install: Installs brew

  all-installs: Installs all formulas, casks, fonts and app store apps
  	 install-formulas: Installs all formulas
  	 install-casks: Installs all casks
  	 install-fonts: Installs all fonts
  	 install-appstore-apps: Installs all app store apps
  	 install-dotnet-tools: Installs all dotnet global tools
  	 install-dotnet-workloads: Installs all dotnet workloads

  all-configs: Deploys all configs
  	 pre-config: Creates config folders
  	 config-zsh: Deploys zsh config
  	 config-ssh: Deploys ssh config
  	 config-alacritty: Deploys alacritty config
  	 config-starship: Deploys starship config
  	 config-tmux: Deploys tmux config
  	 config-git: Deploys git config
  	 config-htop: Deploys htop config
  	 config-nvim: Deploys neovim config
  	 config-dotnet: Deploys dotnet config
```


