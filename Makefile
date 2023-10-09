VIMRC_URL := https://github.com/danielcristho/dotfiles/blob/main/vim/.vimrc
VIMRC:= $(HOME)/.vimrc
PLUGGED_DIR := $(HOME)/.vim/plugged

install: install-plugin
.PHONY: all install clean

# Run make install
all: install
install-plugin:
.PHONY: all install clean

	sudo mkdir -p $(PLUGINDIR)
# Run make install
install: $(VIMRC)
	vim +PlugInstall +qall

$(VIMRC_FILE):
	wget $(VIMRC_URL) -O $(VIMRC)

# Run make clean
clean:
clean:
	sudo rm -rf $(PLUGINDIR)/*
	rm -rf $(PLUGGED_DIR)
