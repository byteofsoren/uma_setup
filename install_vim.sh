#!/bin/bash
olddir=$(pwd)
echo "Remove old vim"
sudo apt remove vim vim-runtime gvim
echo "Installe softwar of building vim"
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git


echo "Clone vim from git"
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --enable-python2interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --with-python2-config-dir=$(python2-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/usr/local


make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo apt install checkinstall
sudo checkinstall
sudo make install
echo "Done"
cd $olddir

sudo cp clang-format.py /usr/local/bin/clang-format.py
