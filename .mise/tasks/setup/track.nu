#!/usr/bin/env nu

#MISE description="Scan through a directory and choose what keep track of. When you say yes to trakcing, that file is moved into dotfiles and symlinked back to its original location. When you say no, it' saved to an ignore list and never asked again"

let ignored_files = if ('dotbot_ignore' | path exists) {
  'dotbot_ignore' | open | lines
} else {
  []
}

print '
  Choose which dotfiles to track:
  y -> yes
  n -> no
  d -> never ask again
  q -> quit
'

let all_dotfiles = glob --no-dir --no-symlink --depth 1 $'($env.HOME)/.*' 
let dotfiles = $all_dotfiles | where $it not-in $ignored_files
print $dotfiles

$dotfiles | each {|dotfile| 
  let filename = $dotfile | path relative-to $env.HOME
  let track = [$filename] | (input --numchar 1 --default 'y' --suppress-output $'($in | first)')
  print ""

  match $track {
    'y' => { cp $dotfile ./HOME/ },
    'n' => {},
    'd' => { $"($filename)\n" | save --append "dotbot_ignore" }
    'q' => { exit 0 }
  }
}
