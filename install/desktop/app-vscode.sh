brew install --cask visual-studio-code

mkdir -p ~/Library/Application\ Support/Code/User
cp ~/.local/share/omacase/configs/vscode.json ~/Library/Application\ Support/Code/User/settings.json

# Install default supported themes
code --install-extension enkia.tokyo-night