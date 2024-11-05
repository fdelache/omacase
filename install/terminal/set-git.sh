# Configure git to use omacase config file.
if ! git config --global --get-all include.path | grep -qF ~/.local/share/omacase/defaults/git_config; then
    # If not found, add the omacase path to the global git config
    git config set --append --global include.path ~/.local/share/omacase/defaults/git_config
fi

cp ~/.local/share/omacase/configs/gitignore ~/.gitignore
