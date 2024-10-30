brew install zellij

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omacase/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/omacase/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
