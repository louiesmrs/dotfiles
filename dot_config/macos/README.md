# macOS

## Setting up a new Mac

```console
# install Xcode Command Line Tools
xcode-select --install
# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# clone the dotfiles repo
git clone https://github.com/adamelmore/dotfiles.git ~/.dotfiles
# install Brewfile
cd ~/.dotfiles/macos
brew bundle
# setup mac defaults
./set-defaults.sh
brew bundle install --cleanup --file=~/.config/Brewfile
```
```
# Launch nu without saving history (this prevents recreating the config folder during the move)
nu --no-history

# Move configuration to new location (preserves existing history and settings)
mv $nu.default-config-dir ~/.config/

# Verify that the folder appeared
ls ~/.config/nushell

# Create symbolic link (ensures config is found even when XDG_CONFIG_HOME isn't set)
# The command in parens gets the parent directory of the old config location to create a symlink at
ln -s ~/.config/nushell ($nu.default-config-dir | path dirname)

# Verify that the symbolic link works
ls $nu.default-config-dir


ln -sf ~/.config/Code/User/keybindings.json  `~/Library/Application Support/Code/User/keybindings.json`
ln -sf ~/.config/Code/User/settings.json  `~/Library/Application Support/Code/User/settings.json`
```
