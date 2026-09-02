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

## Firefox userChrome.css

1. Open Firefox and enter `about:config` in the address bar.
2. Accept the warning, search for `toolkit.legacyUserProfileCustomizations.stylesheets`, and set it to `true`.
3. Open `about:profiles` in a new tab.
4. Find the profile marked **This is the profile in use** and click **Open Directory** next to **Root Directory**.
5. In the Finder window that opens, create a folder named `chrome`.
6. Copy or drag `~/.config/firefox/chrome/userChrome.css` into that `chrome` folder.
7. Restart Firefox.

Firefox does not provide a browser UI for uploading or symlinking `userChrome.css`; the profile preference can be changed in Firefox, but placing the file requires Finder or a terminal.
