# Configure git to use omacase config file.
if ! git config --global --get-all include.path | grep -qF ~/.local/share/omacase/configs/git_config; then
    # If not found, add the omacase path to the global git config
    git config set --append --global include.path ~/.local/share/omacase/configs/git_config
fi
