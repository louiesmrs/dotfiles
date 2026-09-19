# Dotfiles

This repository contains my configuration files and is managed with [chezmoi](https://www.chezmoi.io/).

## Homebrew package management


```console
brew bundle install --cleanup --file="$HOME/.config/Brewfile" --no-lock
```

For temporary software, use the normal `brew install` command. It will be
removed automatically the next time the Brewfile is synchronized. See
[this Brewfile guide](https://matthiasportzel.com/brewfile/) for more context.

## macOS

Install chezmoi and apply this repository:

```console
brew install chezmoi
chezmoi init --apply https://github.com/louiesmrs/dotfiles.git
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
