brew install --cask visual-studio-code

mkdir -p ~/Library/Application\ Support/Code/User
cp ~/.local/share/omacase/configs/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp ~/.local/share/omacase/configs/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Install default supported themes
code --install-extension enkia.tokyo-night