if [[ -v OMACASE_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMACASE_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in ${(f)apps}; do
			source "$OMACASE_PATH/install/desktop/optional/app-${(L)app}.sh"
		done
	fi
fi