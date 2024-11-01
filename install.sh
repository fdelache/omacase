# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omacase/install/check-version.sh

echo "Get ready to make a few choices"
source ~/.local/share/omacase/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omacase/install/first-run-choices.sh

echo "Installing terminal and desktop tools..."
source ~/.local/share/omacase/install/terminal.sh
source ~/.local/share/omacase/install/desktop.sh

echo "Omacase installation complete 🚀"
echo 'You can always run the `omacase` command to configure and update omacase'