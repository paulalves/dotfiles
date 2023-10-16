COLOR_GREEN=\033[0;32m
COLOR_YELLOW=\033[0;33m
END_COLOR=\033[0m

IS_BREW_INSTALLED := $(shell which brew > /dev/null 2>&1; echo $$?)

all: brew-setup all-installs all-configs

.PHONY: all

brew-setup: 
ifeq ($(IS_BREW_INSTALLED),1)
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Brew is not installed.$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"; 
	make brew-install	
endif

brew-install:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Installing Brew$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sudo xcodebuild -license accept
	brew update

all-installs: install-formulas install-casks install-fonts install-appstore-apps install-dotnet-tools install-dotnet-workloads
	
install-formulas:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Installing Brew Formulas$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	@while read -r formula; do brew install $$formula; done < ${PWD}/brew/formulas.txt

install-casks:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Installing Brew Casks$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	@while read -r cask; do brew install --cask $$cask; done < ${PWD}/brew/casks.txt

install-fonts:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Programming Fonts$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	cp -vf ${PWD}/fonts/NerdFonts/* ~/Library/Fonts/
	cp -vf ${PWD}/fonts/Powerline/* ~/Library/Fonts/

install-appstore-apps:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Installing App Store Apps$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	@mas list >/dev/null 2>&1 # needs a initial run to work
	@while read -r app; do info=($$app); mas install $$(echo "$$info" | awk '{print$1}'); done < ${PWD}/mas/apps.txt

install-dotnet-tools:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Installing DOTNET global tools$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	@while read -r tool; do echo "dotnet tool install --global $$tool"; dotnet tool install --global $$tool &>/dev/null || true; done < ${PWD}/dotnet/tools.txt

install-dotnet-workloads:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Installing DOTNET workloads$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	@while read -r workload; do echo "dotnet workload install $$workload"; dotnet workload install $$workload &>/dev/null || true; done < ${PWD}/dotnet/workloads.txt

all-configs: pre-config config-zsh config-ssh config-alacritty config-starship config-tmux config-git config-gh config-htop config-nvim config-dotnet

pre-config:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Creating Config Folders$(END_COLOR)"; 
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	mkdir -p ~/.ssh/
	mkdir -p ~/.dotnet
	mkdir -p ~/.nuget/NuGet
	mkdir -p ~/.config/htop
	mkdir -p ~/.config/alacritty
	mkdir -p ~/workspace/paulalves/
	mkdir -p ~/workspace/topo/

config-zsh:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying ZSH Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	[ -f ~/.zprofile ] && mv ~/.zprofile ~/.zprofile.old || true
	[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.old || true
	[ -f ~/.zshenv ] && mv ~/.zshenv ~/.zshenv.old || true
	ln -s ${PWD}/zsh/zprofile ~/.zprofile
	ln -s ${PWD}/zsh/zshrc ~/.zshrc
	ln -s ${PWD}/zsh/zshenv ~/.zshenv

config-ssh:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying SSH Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"	
	[ -f ~/.ssh/config ] && mv ~/.ssh/config ~/.ssh/config.old || true
	ln -s ${PWD}/ssh/config ~/.ssh/config

config-alacritty:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Alacritty Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"	
	[ -f ~/.config/alacritty/alacritty.yml ] && mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.old || true
	ln -s ${PWD}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

config-starship:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Starship Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"	
	[ -f ~/.config/starship.toml ] && mv ~/.config/starship.toml ~/.config/starship.toml.old || true
	ln -s ${PWD}/starship/starship.toml ~/.config/starship.toml

config-tmux:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Tmux Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old || true
	ln -s ${PWD}/tmux/tmux.conf ~/.tmux.conf

config-git:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Git Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.old || true
	[ -f ~/.paulalves.gitconfig ] && mv ~/.paulalves.gitconfig ~/.paulalves.gitconfig.old || true
	[ -f ~/.topo.gitconfig ] && mv ~/.topo.gitconfig ~/.topo.gitconfig.old || true	
	ln -s ${PWD}/git/gitconfig ~/.gitconfig
	ln -s ${PWD}/git/paulalves.gitconfig ~/.paulalves.gitconfig
	ln -s ${PWD}/git/topo.gitconfig ~/.topo.gitconfig

config-gh:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Git Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	[ -f ~/.config/gh/config.yml ] && mv ~/.config/gh/config.yml ~/.config/gh/config.yml.old || true
	[ -f ~/.config/gh/hosts.yml ] && mv ~/.config/gh/hosts.yml ~/.config/gh/hosts.yml.old || true
	ln -s ${PWD}/gh/config.yml ~/.config/gh/config.yml
	ln -s ${PWD}/gh/hosts.yml ~/.config/gh/hosts.yml

config-htop:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Htop Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)";	
	[ -f ~/.config/htop/htoprc ] && cp ~/.config/htop/htoprc ~/.config/htop/htoprc.old && rm ~/.config/htop/htoprc || true
	ln -s ${PWD}/htop/htop ~/.config/htop/htoprc

config-nvim:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)"; 
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Neovim Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	[ -d ~/.config/nvim.old ] && rm -rf ~/.config/nvim.old || true
	[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.old || true 
	ln -s ${PWD}/nvim ~/.config/nvim

config-dotnet:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Deploying Dotnet Config$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	[ -f ~/.nuget/NuGet/nuget.config ] && mv ~/.nuget/NuGet/nuget.config ~/.nuget/NuGet/nuget.config.old || true 
	ln -s ${PWD}/dotnet/nuget.config ~/.nuget/NuGet/nuget.config

encrypt-keys: 
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Encrypting keys file$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	gpg --symmetric --cipher-algo AES256 ${PWD}/keys/PAID_LICENSES.txt

decrypt-keys:
	@echo "$(COLOR_YELLOW)╔═════════════════════════════════════════════════════════════════╗$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR) $(COLOR_GREEN)Decrypting keys file$(END_COLOR)";
	@echo "$(COLOR_YELLOW)║$(END_COLOR)"
	gpg --decrypt --output ${PWD}/keys/PAID_LICENSES.txt ${PWD}/keys/PAID_LICENSES.txt.gpg

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo ""
	@echo "  all: Installs all formulas, casks, fonts, app store apps and configs"
	@echo "  brew-setup: Installs brew if not installed"
	@echo "  brew-install: Installs brew"
	@echo ""
	@echo "  all-installs: Installs all formulas, casks, fonts and app store apps"
	@echo "  \t install-formulas: Installs all formulas"
	@echo "  \t install-casks: Installs all casks"
	@echo "  \t install-fonts: Installs all fonts"
	@echo "  \t install-appstore-apps: Installs all app store apps"
	@echo "  \t install-dotnet-tools: Installs all dotnet global tools"
	@echo "  \t install-dotnet-workloads: Installs all dotnet workloads"
	@echo ""
	@echo "  all-configs: Deploys all configs"
	@echo "  \t pre-config: Creates config folders"
	@echo "  \t config-zsh: Deploys zsh config"
	@echo "  \t config-ssh: Deploys ssh config"
	@echo "  \t config-alacritty: Deploys alacritty config"
	@echo "  \t config-starship: Deploys starship config"
	@echo "  \t config-tmux: Deploys tmux config"
	@echo "  \t config-git: Deploys git config"
	@echo "  \t config-gh: Deploys gh config"
	@echo "  \t config-htop: Deploys htop config"
	@echo "  \t config-nvim: Deploys neovim config"
	@echo "  \t config-dotnet: Deploys dotnet config" 
