git clone https://github.com/toguri/dotfiles.git
ln -s src/dotfiles/.zshrc ~/.zshrc

if you use zinit ...
sh -c "$(curl -fsSL https://git.io/zinit-install)"
source ~/.zshrc
zinit self-update
