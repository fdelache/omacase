# Create the fonts directory if it doesn't exist
mkdir -p ~/Library/Fonts

# Change to the temporary directory
cd /tmp

# Download and install Cascadia Mono
curl -L -o CascadiaMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/Library/Fonts
rm -rf CascadiaMono.zip CascadiaFont

# Download and install iA Writer Mono
curl -L -o iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
unzip iafonts.zip -d iaFonts
cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/Library/Fonts
rm -rf iafonts.zip iaFonts
