#!/usr/bin/bash

BASE_DIR=$(dirname $0)
PACKAGES="git curl gcc fzf cmake rustup python"
INST_PKG=false


if $INST_PKG; then
	echo Installing packages
	sudo pacman -Syu --noconfirm $PACKAGES

	echo Installing rust tools
	rustup install stable
	rustup install nightly
	cargo  install --force racer
fi

echo Checking existing utilities
required_utils="$PACKAGES rustc cargo"
for util in $required_utils; do
	echo " -> $util"

	if ! command -v $util > /dev/null; then
		echo "looks like $util is missing"
		exit 1
	fi
done

echo Removing existing vim config files
rm -rf \
	$HOME/.vim \
	$HOME/.vimrc \
	$HOME/.config/nvim

echo Installing config
cp $BASE_DIR/.vimrc $HOME

echo Installing vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 2> /dev/null

if command -v nvim > /dev/null; then
	echo Adding symlinks for Neovim
	ln -s $HOME/.vimrc $HOME/.vim/init.vim
	ln -s $HOME/.vim $HOME/.config/nvim
fi

for editor in vim nvim; do
	if command -v $editor > /dev/null; then
		echo Installing $editor plugins
		$editor  -c "PlugInstall" -c "qa"
	fi
done

