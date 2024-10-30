# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omacase/install/check-version.sh

echo "Only installing terminal tools..."

# Install terminal tools
source ~/.local/share/omacase/install/terminal.sh
