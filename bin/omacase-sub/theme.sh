# Define the array of theme names
THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")

# Use gum to choose a theme and process the output
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

# Check if THEME is not empty and not "<< Back"
if [[ -n "$THEME" && "$THEME" != "<<-back" ]]; then
  kitten themes --reload-in=all $(cat $OMACASE_PATH/themes/$THEME/kitty-name.theme)
  cp "$OMACASE_PATH/themes/$THEME/zellij.kdl" ~/Library/Application\ Support/org.Zellij-Contributors.Zellij/themes/$THEME.kdl
  sed -i .bak "s/theme \".*\"/theme \"$THEME\"/g" ~/Library/Application\ Support/org.Zellij-Contributors.Zellij/config.kdl
  cp "$OMACASE_PATH/themes/$THEME/neovim.lua" ~/.config/nvim/lua/plugins/theme.lua

  source "$OMACASE_PATH/themes/$THEME/vscode.sh"

  # Forgo setting the Chrome theme until we might find a less disruptive way of doing it.
  # Having to quit Chrome, and all Chrome-based apps, is too much of an imposition.
  # source "$OMACASE_PATH/themes/$THEME/chrome.sh"
fi

source "$OMACASE_PATH/bin/omacase-sub/menu.sh"