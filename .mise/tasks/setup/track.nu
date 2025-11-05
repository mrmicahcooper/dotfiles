#!/usr/bin/env nu

#MISE description="Scan through a directory and choose what keep track of. When you say yes to trakcing, that file is moved into dotfiles and symlinked back to its original location. When you say no, it' saved to an ignore list and never asked again"

const ignore_filename = 'dotbot_ignore'

let ignored_files = if ($ignore_filename | path exists) {
  $ignore_filename | open | lines 
} else {
  []
}

let tracked_files = ls --all "HOME"

reduce --fold [] {|file, acc|   
 let filename = [$env.HOME $file] | path join 
 $acc | append $filename
}

print '
  Choose which dotfiles to track:
  y -> yes
  n -> no
  d -> never ask again
  q -> quit
'

let host_files = (glob --no-dir --no-symlink --depth=1 $'($env.HOME)/.*') | where {|file| $file not-in $ignored_files}

$host_files | each {|choice| 
  let track = [$choice] | (input --numchar 1 --default 'y' $'($in | first)')

  match $track {
    'y' => { cp $choice ./HOME/ },
    'n' => {},
    'd' => { $"($choice)\n" | save --append $ignore_filename}
    'q' => { exit 0 }
  }
}
