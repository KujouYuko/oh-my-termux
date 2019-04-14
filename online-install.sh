#!/data/data/com.termux/files/usr/bin/bash
## Author : TH779
## Email  : tongsj2333@gmail.com

DIR="$(pwd)"

echo " [ ] Installing dependencies..."
apt-get update && apt-get install -y git zsh
echo " [*] Succesfully installed!"

echo " [ ] Adding config..."
if [ -d $HOME/.termux ]; then
mv $HOME/.termux $HOME/.termux.bak
fi
if [ ! -d $HOME/.termux ]; then
mkdir $HOME/.termux
fi
curl -fsLo $HOME/.termux/font.ttf https://github.com/hh2333/oh-my-termux/raw/master/.termux/font.ttf
curl -fsLo $HOME/.termux/termux.properties https://github.com/hh2333/oh-my-termux/raw/master/.termux/termux.properties
echo " [*] Succesfully Added!"

echo " [ ] Cloning oh-my-zsh files..."
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth=1
echo " [*] Succesfully cloned!"

echo " [ ] Setting zsh..."
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' $HOME/.zshrc
chsh -s zsh
echo " [*] Succesfully!"

echo " [ ] Getting storage permission and reload termux..."
termux-setup-storage
termux-reload-settings
echo " [*] Done!"