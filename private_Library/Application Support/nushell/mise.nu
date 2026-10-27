def "parse vars" [] {
  $in | from csv --noheaders --no-infer | rename 'op' 'name' 'value'
}

def --env "update-env" [] {
  for $var in $in {
    if $var.op == "set" {
      if ($var.name =~ '(?i)^path$') {
        $env.PATH = ($var.value | split row (char esep))
      } else {
        load-env {($var.name): $var.value}
      }
    } else if $var.op == "hide" {
      try { hide-env $var.name }
    }
  }
}
export-env {
  $env.__MISE_ORIG_PATH = r#'/Users/micah.cooper/.opencode/bin:/Users/micah.cooper/.local/share/mise:/Users/micah.cooper/.local/bin:/Users/micah.cooper/.local/bin/mise:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Ghostty.app/Contents/MacOS'#
$env.PATH = (r#'/Users/micah.cooper/.local/share/mise/shims:/Users/micah.cooper/.opencode/bin:/Users/micah.cooper/.local/share/mise:/Users/micah.cooper/.local/bin:/Users/micah.cooper/.local/bin/mise:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Ghostty.app/Contents/MacOS'# | split row (char esep))

  '' | parse vars | update-env
  $env.MISE_SHELL = "nu"
  let mise_hook = {
    condition: { "MISE_SHELL" in $env }
    code: { mise_hook }
  }
  add-hook hooks.pre_prompt $mise_hook
  add-hook hooks.env_change.PWD $mise_hook
}

def --env add-hook [field: cell-path new_hook: any] {
  let field = $field | split cell-path | update optional true | into cell-path
  let old_config = $env.config? | default {}
  let old_hooks = $old_config | get $field | default []
  $env.config = ($old_config | upsert $field ($old_hooks ++ [$new_hook]))
}

export def --env --wrapped main [command?: string, --help, ...rest: string] {
  let commands = ["deactivate", "shell", "sh"]

  if ($command == null) {
    ^"/Users/micah.cooper/.local/bin/mise"
  } else if ($command == "activate") {
    $env.MISE_SHELL = "nu"
  } else if ($command in $commands) {
    ^"/Users/micah.cooper/.local/bin/mise" $command ...$rest
    | parse vars
    | update-env
  } else {
    ^"/Users/micah.cooper/.local/bin/mise" $command ...$rest
  }
}

def --env mise_hook [] {
  ^"/Users/micah.cooper/.local/bin/mise" hook-env -s nu
    | parse vars
    | update-env
}

