if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo ""
echo "Closing any open System Preferences panes..."
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
sudo -v
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
