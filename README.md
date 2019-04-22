# dotfiles
Personal dotfiles

# Changing gtk theme
vim .config/gtk-3.0/settings.ini 


#Install all the package

# Marking all the package for unistall
dpkg --clear-selections

# Selecting all the package to install from package.list
dpkg --set-selections < package.list

# Apply modification on the marked package 
sudo apt-get dselect-upgrade

