# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.XDG_CONFIG_HOME = ($env.HOME + "/.config")
$env.PATH = ($env.PATH | split row (char esep)
# configs
$env.config.shell_integration.osc133 = false
$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"

# alias 
alias l = eza -l --icons --git -a
alias lt = eza --tree --level=2 --long --icons --git
alias ltree = eza --tree --level=2 --icons --git
alias vi = nvim
alias vim = nvim

# invoke shell
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
$env.STARSHIP_CONFIG = ($env.XDG_CONFIG_HOME + "/starship/starship.toml")
source ~/.zoxide.nu

$env.config.show_banner = false
