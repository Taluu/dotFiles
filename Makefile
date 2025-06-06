BIN_DIR := ~/.local/bin

sync:
	@dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profile.dconf
	@-[[ -f ~/.gitignore ]] || ln -s `pwd`/.git_ignore ~/.gitignore
	@-[[ -f ~/.gitconfig ]] || ln -s `pwd`/.gitconfig ~/.gitconfig
	@-[[ -d ~/.git-templates ]] || ln -s `pwd`/.git-templates ~/.git-templates
	@-[[ -f ~/.tmux.conf ]] || ln -s `pwd`/.tmux.conf ~/.tmux.conf
	@-[[ -f ~/.wezterm.lua ]] || ln -s `pwd`/.wezterm.lua ~/.wezterm.lua
	@-[[ -d ~/.zsh_completions ]] || mkdir -p ~/.zsh_completions
	@-[[ -f ~/.zshrc ]] || ln -s `pwd`/zsh/config.zsh ~/.zshrc
	@-[[ -f ~/.git_personnal_config ]] || touch ~/.git_personnal_config
	@-[[ -d ${BIN_DIR} ]] || mkdir ${BIN_DIR}
	@-[[ -f ${BIN_DIR}/git-repo-size ]] || ln -s `pwd`/utils/git-repo-size ${BIN_DIR}/git-repo-size
	@-[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
	@-[[ -f ~/.config/nvim/init.lua	]] || ln -s `pwd`/vim/init.vim ~/.config/nvim/init.lua
	@-[[ -d ~/.config/nvim/lua	]] || ln -s `pwd`/vim/lua ~/.config/nvim/lua
	@-[[ -d ~/.config/nvim/after ]] || ln -s `pwd`/vim/after ~/.config/nvim/after

clean:
	@rm ~/.gitignore
	@rm ~/.gitconfig
	@rm -r ~/.git-templates
	@rm ~/.git_personnal_config
	@rm ~/.tmux.conf
	@rm -rf ${BIN_DIR}
	@rm -rf ~/.zsh_completions
	@rm ~/.config/nvim/*
	@rm ~/.zshrc

install:
	@echo 'TODO LOL ?'

.PHONY: sync clean install
