UNINSTALLER=$(gum file $OMACASE_PATH/uninstall)
[ -n "$UNINSTALLER" ] && gum confirm "Run uninstaller?" && source $UNINSTALLER && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
clear
source $OMACASE_PATH/bin/omacase
