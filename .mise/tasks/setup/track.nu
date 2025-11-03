#!/usr/bin/env nu

#MISE description="Scan through a directory and choose what keep track of. When you say yes to trakcing, that file is moved into dotfiles and symlinked back to its original location. When you say no, it' saved to an ignore list and never asked again"

print '
  Choose which dotfiles to track:
  y -> yes
  n -> no
  d -> never ask again
'

glob --no-dir --no-symlink --depth 1 $'($env.HOME)/.*' | each {|file| 
  let filename = $file | path relative-to $env.HOME

  let track = [$filename] | (input 
    --numchar 1 
    --default 'y'
    --suppress-output
    $'($in | first)'
  )
  
  print "\n"

  if ($track == 'y') {
    cp $file ./HOME/
  }

}
