# Dotfiles

This repository contains my configuration files and is managed with [chezmoi](https://www.chezmoi.io/).

## macOS

Install Apple's command-line tools and Homebrew:

```console
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install chezmoi and apply this repository:

```console
brew install chezmoi
chezmoi init --apply https://github.com/louiesmrs/dotfiles.git
```

Install the packages from the managed Brewfile:

```console
brew bundle --file="$HOME/.config/Brewfile"
```

Apply macOS defaults:

```console
~/.config/macos/set-defaults.sh
```

## Bazzite

Install chezmoi and apply this repository:

```console
brew install chezmoi
chezmoi init --apply https://github.com/louiesmrs/dotfiles.git
```

Install the packages from the managed Brewfile:

```console
brew bundle --file="$HOME/.config/Brewfile"
```

Log out and back in, or restart the terminal, after applying the configuration so
that Nushell and WezTerm pick up the Linuxbrew environment.

## Updating

Pull the latest source and apply it:

```console
chezmoi update
```

When changing a managed file in place, update the chezmoi source with:

```console
chezmoi re-add ~/.config/path/to/file
```

## Firefox userChrome.css

1. Open Firefox and enter `about:config` in the address bar.
2. Accept the warning, search for `toolkit.legacyUserProfileCustomizations.stylesheets`, and set it to `true`.
3. Open `about:profiles` in a new tab.
4. Find the profile marked **This is the profile in use** and click **Open Directory** next to **Root Directory**.
5. In the Finder or file manager window that opens, create a folder named `chrome`.
6. Copy `~/.config/firefox/chrome/userChrome.css` into that `chrome` folder.
7. Restart Firefox.

Firefox does not provide a browser UI for uploading `userChrome.css`; the preference can be changed in Firefox, but placing the file requires the file manager or a terminal.
