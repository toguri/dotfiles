if you use zinit ...
sh -c "$(curl -fsSL https://git.io/zinit-install)"
source ~/.zshrc
zinit self-update

git clone https://github.com/toguri/dotfiles.git
ln -s ~/src/dotfiles ~/dotfiles

' increment search (https://github.com/peco/peco)
brew install peco

Run below script.
https://github.com/Shougo/dein.vim
