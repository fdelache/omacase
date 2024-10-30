if [ $# -eq 0 ]; then
	SUB=$(gum choose "Theme" "Font" "Update" "Install" "Uninstall" "Quit" --height 10 --header "" | tr '[:upper:]' '[:lower:]')
else
	SUB=$1
fi

[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $OMACASE_PATH/bin/omacase-sub/$SUB.sh
