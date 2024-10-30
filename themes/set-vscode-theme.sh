if command -v code &>/dev/null; then
  code --install-extension $VSC_EXTENSION >/dev/null
  sed -i .bak "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" ~/Library/Application\ Support/Code/User/settings.json
fi
