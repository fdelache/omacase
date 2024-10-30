set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	local file_name="${font_name/ Nerd Font/}"

	if ! ls ~/Library/Fonts | grep -i "$font_name" >/dev/null; then
		cd /tmp || exit
		curl -L -o "$file_name.zip" "$url"
		unzip "$file_name.zip" -d "$file_name"
		cp "$file_name"/*."$file_type" ~/Library/Fonts/
		rm -rf "$file_name.zip" "$file_name"
		clear
		source "$OMACASE_PATH/ascii.sh"
	fi

	# Note: macOS does not use gsettings. You may need to set the font in your terminal emulator settings manually.
	# For example, if you're using iTerm2, you can set the font in its preferences.

	# Update Alacritty configuration
	#cp "$OMACASE_PATH/configs/alacritty/fonts/$file_name.toml" ~/.config/alacritty/font.toml
	sed -i '' "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/Library/Application\ Support/Code/User/settings.json
}

if [ "$#" -gt 1 ]; then
	choice=${!#}
else
	choice=$(gum choose "Cascadia Mono" "Fira Mono" "JetBrains Mono" "Meslo" "> Change size" "<< Back" --height 8 --header "Choose your programming font")
fi

case $choice in
"Cascadia Mono")
	set_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf"
	;;
"Fira Mono")
	set_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf"
	;;
"JetBrains Mono")
	set_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf"
	;;
"Meslo")
	set_font "MesloLGS Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" "ttf"
	;;
"> Change size")
	source "$OMACASE_PATH/bin/omacase-sub/font-size.sh"
	exit
	;;
esac

source "$OMACASE_PATH/bin/omacase-sub/menu.sh"