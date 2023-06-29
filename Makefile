VIMRC_URL := https://github.com/danielcristho/dotfiles/blob/main/vim/.vimrc
VIMRC := $(HOME)/.vimrc
PLUGGED_DIR := $(HOME)/.vim/plugged

#THEME_URL := https://github.com/danielcristho/dotfiles/tree/main/theme/Jasper-Dark
#THEME_DIR := $(HOME)/.themes 

.PHONY: all install clean

all: install

# Run make install 
install: $(VIMRC)
	vim +PlugInstall +qall

$(VIMRC):
	wget $(VIMRC_URL) -O $(VIMRC)
	

#$(THEME_DIR):
#	mkdir -p $(THEME_DIR)
#	wget $(THEME_URL) -O $(THEME_DIR)/Jasper-Dark
# Run make clean
clean:
	rm -rf $(PLUGGED_DIR)
