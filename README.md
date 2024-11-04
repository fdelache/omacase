# Omacase

Turn a fresh MacOs installation into a fully-configured, beautiful, and modern development system by running a single command. That's the one-line pitch for Omacase. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omacase is an opinionated take on what MacOs can be at its best.

This is a fork of [Omakub](https://omakub.org/) adapted to the MacOs and its zsh shell. A lot of the tooling included in Omakub is not yet included in Omacase, as this is a work in progress.

# Installation

Run the following to install Omacase for the first time
```bash
curl -sSL https://franck.isalazy.dev/omacase/install | zsh
```

# Usage
Once Omacase has been installed, you can configure it using the `omacase` command.
![omacase-demo](https://github.com/user-attachments/assets/8c97f835-ace3-45e6-bc81-1daf15ead7b0)

# What's included?
Omacase uses [Raycast](https://www.raycast.com/) as its launcher[^1] in replacement to Spotlight. Raycast supports clipboard history, meeting quick access, emoji icons and so much more. 

[Rectangle](https://rectangleapp.com/) is used as the window manager[^1], allowing for a fully keyboard centric window placement.

But the main power of Omacase lies in the Terminal. [Kitty](https://sw.kovidgoyal.net/kitty/) is used as the terminal emulator, and runs [Zellij](https://zellij.dev/) to provide multiple pane/sessions. It’s still zsh underneath, but one configured with a host of great file system tools, like eza, fzf, rg, and zoxide.

Then comes the editor(s). Omacase ships with [Neovim](https://neovim.io/) and Microsoft's VSCode. There's also an option to use Rubymine if you would like.

A good system comes with a nice look, that's why Omacase ships with a Tokyo night theme that looks awesome. But you can run the `omacase` command to switch to another theme, change the font or terminal font size. The theme applies to the terminal as well as VSCode.

[^1]: Raycast and Rectangle are not yet automatically installed. This is planned for a future release.

## License

Omacase is released under the [MIT License](https://opensource.org/licenses/MIT).

