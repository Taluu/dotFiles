BIN_DIR := ~/bin

sync:
	@-[[ -f ~/.gitignore ]] || ln -s `pwd`/.gitignore ~/.gitignore
	@-[[ -f ~/.gitconfig ]] || ln -s `pwd`/.gitconfig ~/.gitconfig
	@-[[ -d ~/.git-templates ]] || ln -s `pwd`/.git-templates ~/.git-templates
	@-[[ -f ~/.tmux.conf ]] || ln -s `pwd`/.tmux.conf ~/.tmux.conf
	@-[[ -f ~/.php-version ]] || ln -s `pwd`/.php-version ~/.php-version
	@-[[ -f ~/.tool-versions ]] || ln -s `pwd`/.tool-versions ~/.tool-versions
	@-[[ -d ~/.config/composer ]] || mkdir -p ~/.config/composer
	@-[[ -f ~/.config/composer/composer.json ]] || ln -s `pwd`/composer.json ~/.config/composer/composer.json
	@-[[ -f ~/.antigenrc ]] || ln -s `pwd`/zsh/antigen.zsh ~/.antigenrc
	@-[[ -f ~/.zshrc ]] || ln -s `pwd`/zsh/config.zsh ~/.zshrc
	@-[[ -d ${BIN_DIR} ]] || mkdir ${BIN_DIR}
	@-[[ -f ${BIN_DIR}/diff-highlight ]] || ln -s `pwd`/utils/diff-highlight ${BIN_DIR}/diff-highlight
	@-[[ -f ${BIN_DIR}/git-prune-merged ]] || ln -s `pwd`/utils/git-prune-merged ${BIN_DIR}/git-prune-merged
	@-[[ -f ${BIN_DIR}/git-repo-size ]] || ln -s `pwd`/utils/git-repo-size ${BIN_DIR}/git-repo-size
	@-[[ -f ${BIN_DIR}/git-wtf ]] || ln -s `pwd`/utils/git-wtf ${BIN_DIR}/git-wtf
	@-[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
	@-[[ -f ~/.config/nvim/init.vim ]] || ln -s `pwd`/nvim/init.vim ~/.config/nvim/init.vim
	@-[[ -f ~/.config/nvim/plugins.vim ]] || ln -s `pwd`/nvim/plugins.vim ~/.config/nvim/plugins.vim
	@-[[ -d ~/.config/psalm ]] || mkdir -p ~/.config/psalm
	@-[[ -f ~/.config/psalm/global.xml ]] || ln -s `pwd`/psalm/global.xml ~/.config/psalm/global.xml

clean:
	@rm ~/.gitignore
	@rm ~/.gitconfig
	@rm -r ~/.git-templates
	@rm ~/.tmux.conf
	@rm ~/.php-version
	@rm ~/.tool-versions
	@rm -rf ${BIN_DIR}
	@rm ~/.config/nvim/init.vim ~/.config/nvim/plugins.vim
	@rm ~/.config/composer/composer.json ~/.config/composer/composer.lock
	@rm ~/.config/psalm/global.xml

install:
	@echo 'TODO LOL ?'

.PHONY: sync unsync install
