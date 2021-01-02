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
	@-[[ -f ~/.zshrc ]] || ln -s `pwd`/zsh/config.zsh ~/.zshrc
	@-[[ -d ${BIN_DIR} ]] || mkdir ${BIN_DIR}
	@-[[ -f ${BIN_DIR}/diff-highlight ]] || ln -s `pwd`/utils/diff-highlight ${BIN_DIR}/diff-highlight
	@-[[ -f ${BIN_DIR}/git-prune-merged ]] || ln -s `pwd`/utils/git-prune-merged ${BIN_DIR}/git-prune-merged
	@-[[ -f ${BIN_DIR}/git-repo-size ]] || ln -s `pwd`/utils/git-repo-size ${BIN_DIR}/git-repo-size
	@-[[ -f ${BIN_DIR}/git-wtf ]] || ln -s `pwd`/utils/git-wtf ${BIN_DIR}/git-wtf
# vim is still not xdg compliant, so...
	@-[[ -d ~/.vim ]] || mkdir -p ~/.vim
	@-[[ -f ~/.vim/vimrc ]] || ln -s `pwd`/vim/init.vim ~/.vim/vimrc
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
	@rm ~/.vim/vimrc
	@rm ~/.config/composer/composer.json ~/.config/composer/composer.lock
	@rm ~/.config/psalm/global.xml

install:
	@echo 'TODO LOL ?'

.PHONY: sync unsync install
