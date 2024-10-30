set -e

ascii_art='
   ____
  / __ \____ ___  ____ __________ _________
 / / / / __ `__ \/ __ `/ ___/ __ `/ ___/ _ \
/ /_/ / / / / / / /_/ / /__/ /_/ (__  )  __/
\____/_/ /_/ /_/\__,_/\___/\__,_/____/\___/
'

echo "$ascii_art"
echo "=> Omacase is for fresh MacOs!"
echo "\nBegin installation (or abort with ctrl+c)..."

# Install homebrew
echo "Checking Homebrew..."
if brew --version 2>&1; then
	echo "Homebrew installed!"
else
	echo "Installing Homebrew..."
	/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Cloning Omacase..."
rm -rf ~/.local/share/omacase
git clone https://github.com/fdelache/omacase.git ~/.local/share/omacase >/dev/null
if [[ $OMACASE_REF != "main" ]]; then
	cd ~/.local/share/omacase
	git fetch origin "${OMACASE_REF:-stable}" && git checkout "${OMACASE_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omacase/install.sh
