# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omacase/install/check-version.sh

echo "Get ready to make a few choices"
source ~/.local/share/omacase/install/terminal/app-gum.sh >/dev/null
source ~/.local/share/omacase/install/first-run-choices.sh

echo "Installing terminal and desktop tools..."

# Install terminal tools
source ~/.local/share/omacase/install/terminal.sh

source ~/.local/share/omacase/install/desktop.sh
