choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
	sed -i .bak "s/^size = .*$/size = $choice/g" ~/.config/alacritty/font-size.toml
	source $OMACASE_PATH/bin/omacase-sub/font-size.sh
else
	source $OMACASE_PATH/bin/omacase-sub/font.sh
fi
