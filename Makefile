.PHONY: stow install system
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	ZSH_DIR := zsh-linux
endif
ifeq ($(UNAME_S),Darwin)
	ZSH_DIR := zsh-mac
endif

system:
ifeq ($(UNAME_S),Linux)
	@sudo dnf copr enable jdxcode/mise
	@sudo dnf install gcc clang glib2 glib2-devel python3-devel openssl-devel libyaml-devel luarocks
	@sudo dnf install mise
endif

mise:
	@mise install

shell:
	@if ![ -d "~/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi
	@if ![ -d "$$ZPLUG_HOME" ]; then \
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; \
	fi
	@if ![ -d "~/.oh-my-zsh" ]; then \
		curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh; \
	fi

stow:
	@mkdir -p ~/.config
	@stow --verbose --target=$$HOME/.ssh ssh
	@stow --verbose --target=$$HOME/ $(ZSH_DIR)
	@stow --verbose --target=$$HOME/ tmux
	@stow --verbose --target=$$HOME/ git
	@stow --verbose --target=$$HOME/.config/ config
