brew install zellij

mkdir -p ~/Library/Application\ Support/org.Zellij-Contributors.Zellij
[ ! -f "$HOME/Library/Application\ Support/org.Zellij-Contributors.Zellij/config.kdl" ] && cp ~/.local/share/omacase/configs/zellij.kdl ~//Library/Application\ Support/org.Zellij-Contributors.Zellij/config.kdl
cp ~/.local/share/omacase/themes/tokyo-night/zellij.kdl ~//Library/Application\ Support/org.Zellij-Contributors.Zellij/themes/tokyo-night.kdl
