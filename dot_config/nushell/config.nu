# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
$env.config = {
  bracketed_paste:                  true
  buffer_editor:                    ""
  datetime_format:                  {}
  edit_mode:                        vi
  error_style:                      fancy
  float_precision:                  2
  footer_mode:                      25
  render_right_prompt_on_last_line: false
  show_banner:                      false
  use_ansi_coloring:                true
  use_kitty_protocol:               true

  shell_integration: {
    osc2:                   false
    osc7:                   true
    osc8:                   true
    osc9_9:                 false
    osc133:                 true
    osc633:                 true
    reset_application_mode: true
  }
}

$env.config.ls = {
  clickable_links: true
  use_ls_colors: true
}

$env.config.rm.always_trash = false

$env.config.history = {
  file_format:   sqlite
  isolation:     false
  max_size:      1_000_000
  sync_on_enter: true
}

$env.config.cursor_shape = {
  vi_insert: block
  vi_normal: block
}

$env.config.keybindings ++= [
  {
    name: "char[_normal"
    modifier: "control"
    keycode: "char_[" 
    mode: "vi_insert"
    event: { send: "vichangemode", mode: "normal" }
  }
]
alias lsj = ls 
alias kns = kubens
alias kubectl = kubecolor
alias g = git
alias gs = git status
alias ga = git add
alias gp = git push
alias gpl = git pull
alias gco = git checkout
alias gb = git branch
alias gl = git log --oneline --graph
alias gdiff = git diff

#---Jujutsu------
alias jd = jj desc
alias jf = jj git fetch
alias jn = jj new
alias jp = jj git push
alias js = jj st

#---Eza------
alias ls = eza
alias la = eza --all
alias lla = eza --long --all
alias ll = eza -l
alias l = eza -la

alias cat = bat
alias grep = rg
alias find = fd
alias vim = nvim

alias cp = cp --recursive --verbose --progress
alias mk = mkdir
alias mv = mv --verbose
alias rm = rm --recursive --verbose

def gct [message: string]: nothing -> nothing {
   let msg = ($message | str join " ")
   let currentBranch = (git rev-parse --abbrev-ref HEAD | str trim)

   # split the branch by '/' to drop prefixes like feature/
   let tmp = (echo $currentBranch | split row "/")
   let shortBranch = ($tmp | last)

   # split the short branch by '-' to extract the JIRA id
   let parts = (echo $shortBranch | split row "-")
   let jiraName = (if ($parts | length) >= 2 { ($parts | get 0) + "-" + ($parts | get 1) } else { $shortBranch })

   git commit -m ($jiraName + " " + $msg)

 }

source ~/privatevars.nu
source $"($nu.cache-dir)/carapace.nu"
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ~/.zoxide.nu

