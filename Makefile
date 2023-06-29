VIMRC_URL := https://github.com/danielcristho/dotfiles/blob/main/vim/.vimrc
VIMRC := $(HOME)/.vimrc
PLUGGED_DIR := $(HOME)/.vim/plugged



.PHONY: all install clean

all: install

# Run make install
install: $(VIMRC)
	vim +PlugInstall +qall

$(VIMRC):
	wget $(VIMRC_URL) -O $(VIMRC)


# Run make clean
clean:
	rm -rf $(PLUGGED_DIR)
