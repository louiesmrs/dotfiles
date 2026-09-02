# env.nu
#
# Installed by:
# version = "0.110.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
#
# Path additions
use std/util "path add"
let homebrew_prefix = if $nu.os-info.name == 'linux' {
  '/var/home/linuxbrew/.linuxbrew'
} else {
  '/opt/homebrew'
}
path add ($homebrew_prefix | path join 'bin')
path add ($homebrew_prefix | path join 'sbin')
path add /usr/local/bin
path add /usr/local/go/bin
path add ~/.local/bin
path add ~/go/bin
path add ~/.cargo/bin
path add /usr/local/opt/rustup/bin

if (($homebrew_prefix | path type) == 'dir') {
  $env.HOMEBREW_PREFIX = $homebrew_prefix
  $env.HOMEBREW_CELLAR = ($homebrew_prefix | path join 'Cellar')
  $env.HOMEBREW_REPOSITORY = $homebrew_prefix
}

$env.EDITOR = "nvim"
$env.KUBE_EDITOR = "nvim"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
$env.CARAPACE_MATCH = "1"
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
zoxide init --cmd cd nushell | save -f ~/.zoxide.nu
