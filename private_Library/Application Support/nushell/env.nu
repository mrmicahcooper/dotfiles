# env.nu
#
# Installed by:
# version = "0.108.0"
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
use std/util "path add"

$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
$env.ZELLIJ_SOCKET_DIR = "/tmp/zellij"

path add  /opt/homebrew/bin 
path add  /usr/local/bin 
# path add  ~/.local/bin/mise
path add  ~/.local/bin
path add  ~/.local/share/mise

#
use mise.nu
