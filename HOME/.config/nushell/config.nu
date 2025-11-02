# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false

use ($nu.default-config-dir | path join mise.nu)