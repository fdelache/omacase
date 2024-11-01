brew install kitty

mkdir -p ~/.config/kitty
cp ~/.local/share/omacase/configs/kitty.conf ~/.config/kitty/kitty.conf
cp ~/.local/share/omacase/configs/kitty/zellij.session ~/.config/kitty/zellij.session
cp ~/.local/share/omacase/configs/kitty/fonts/CaskaydiaMono.conf ~/.config/kitty/font.conf
cp ~/.local/share/omacase/configs/kitty/font-size.conf ~/.config/kitty/font-size.conf

kitten themes --reload-in=all Tokyo Night