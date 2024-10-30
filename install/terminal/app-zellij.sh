cd /tmp
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-aarch64-apple-darwin.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd -

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omacase/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/omacase/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
