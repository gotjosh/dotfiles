ROOT=$(HOME)/code/gotjosh/dotfiles

###################
# Link dotfiles   #
###################
link:
	ln -shf $(ROOT)/colors  ~/.colors
	ln -nsf $(ROOT)/git/gitconfig  ~/.gitconfig
	ln -nsf $(ROOT)/git/gitconfig.local  ~/.gitconfig.local
	ln -nsf $(ROOT)/git/cvsignore  ~/.cvsignore
	ln -nsf $(ROOT)/kitty ~/.config/kitty
	ln -shf $(ROOT)/zsh  ~/.zsh
	ln -shf $(ROOT)/zsh/zshrc  ~/.zshrc

install_brews: brew
	brew bundle

brew:
	@hash brew &>/dev/null || \
		ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

vim: $(DIR)/vim/autoload/plug.vim
	nvim +PlugInstall +:q +:q
	PIP_REQUIRE_VIRTUALENV= pip3 install neovim
	gem install neovim
	$(DIR)/vim/plugged/YouCompleteMe/install.py --clang-completer --go-completer

%/plug.vim:
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
