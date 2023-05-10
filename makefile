VIMRC := $(HOME)/.vimrc
PLUGINDIR := $(HOME)/vim/plugged

install: install-plugin

# Run make install
install-plugin:
	sudo mkdir -p $(PLUGINDIR)
	vim +PlugInstall +qall

# Run make clean
clean:
	sudo rm -rf $(PLUGINDIR)/*
