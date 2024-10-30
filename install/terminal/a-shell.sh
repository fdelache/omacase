# Configure the bash shell using Omacase defaults
[ -f "~/.zshrc" ] && mv ~/.zshrc ~/.zshrc.bak
cp ~/.local/share/omacase/configs/zshrc ~/.zshrc

# Load the PATH for use later in the installers
source ~/.local/share/omacase/defaults/zsh/shell
