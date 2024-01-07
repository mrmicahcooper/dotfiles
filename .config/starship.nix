  programs.starship = {
   enable = true;
   settings = {
     format = lib.concatStrings [
     "[╭─󰧂 ](fg:#DA627D)"
     "$directory"
     "$git_branch"
     "$git_status"
     "$c"
     "$\{custom.elixir\}"
     "$elm"
     "$golang"
     "$haskell"
     "$java"
     "$julia"
     "$\{custom.nodejs\}"
     "$nim"
     "$rust"
     "$fill "
     "$aws"
     "$username"
     "$hostname"
     "$os "
     "$memory_usage"
     "$cmd_duration"
     "$line_break"
     "[╰─](fg:#DA627D)"
     "$shell"
     "$jobs"
     "$character"
     ];
     
     command_timeout = 200;
     add_newline = false;
     
     character = {
       success_symbol = "[](bold fg:cyan)";
       error_symbol = "[](bold fg:red)";
     };
     
     shell = {
       style = "fg:#DA627D";
       format = "[$indicator ]($style)";
       disabled = false;
       fish_indicator = "󰈺";
       zsh_indicator = "󰰸";
       bash_indicator = "";
     };
     
     fill = {
       symbol = " ";
       style = "fg:bright-white";
     };
     
     jobs = {
       style = "fg:yellow";
       symbol = "󰑮 ";
       format = "[$symbol$number]($style) ";
     };
     
     cmd_duration = {
       min_time = 0;
       format = "[󱎫 $duration]($style) ";
     };
     
     username = {
       show_always = true;
       style_user = "fg:purple";
       style_root = "fg:purple";
       format = "[$user󰓺 ]($style) ";
       disabled = false;
     };
     
     aws = {
       # format="[$symbol$profile 󰍎$region]($style)";
       format="[$symbol$profile]($style)";
       symbol = " ";
       # symbol = "☁️ ";
     };
     
     "aws.region_aliases" = {
       # us-west-2= "pdx";
       # us-east-1= "iad";
       # eu-west-1= "dub";
       # eu-central-1= "fra";
       # ca-central-1= "iad";
     };
     
     ssh_symbol = "SSH";
     
     hostname = {
       ssh_only = false;
       style="fg:green";
       format = "[󰒍 $ssh_symbol$hostname ]($style)";
       disabled = false;
     };
     
     director = {
       format = "[$path ]($style) ";
       truncation_length = 2;
       truncation_symbol = "… /";
       truncate_to_repo = false;
     };
     
     "directory.substitutions" = {
       "Documents" = " ";
       "Downloads" = " ";
       "Music" = " ";
       "Pictures" = " ";
     };
     
     docker_context = {
       symbol = " ";
       style = "";
       format = "[$symbol $context ]($style) $path";
     };
     
     "custom.elixir" = {
       shell = ["rg" "-N" "elixir " ".tool-versions" "-r" ""];
       symbol = "";
       format = "[$symbol ($output) ]($style)";
       detect_files = ["mix.exs"];
     };
     
     time = {
       disabled = true;
       time_format = "%R"; # Hour:Minute Format
       style = "bg:#33658A";
       format = "[[♥ $time ](bg:#33658A)]($style)";
     };
     
     elixir = {
       symbol = " ";
     };
     
     git_branch = {
       format = "[$symbol$branch ]($style)";
       symbol = " ";
     };
     
     git_status = {
       format = "[($all_status$ahead_behind) ]($style)";
       ahead = "⇡$count";
       diverged = "⇕⇡$ahead_count⇣$behind_count";
       behind = "⇣$count";
     };
     
     golang = {
       symbol = " ";
     };
     
     haskell = {
       symbol = " ";
     };
     
     hg_branch = {
       symbol = " ";
     };
     
     java = {
       symbol = " ";
     };
     
     julia = {
       symbol = " ";
     };
     
     lua = {
       symbol = " ";
     };
     
     memory_usage = {
       symbol = "󰤇 ";
       threshold = 0;
       disabled = false;
       format = "$symbol[$ram_pct]($style) ";
     };
     
     nim = {
       symbol = " ";
       format = "[$symbol $version]($style)";
     };
     
     nix_shell = {
       symbol = " ";
     };
     
     nodejs = {
       symbol = " ";
     };
     
     custom.nodejs = {
       shell = ["node" "--version"];
       symbol = "";
       format = "[$symbol ($output) ]($style)";
       detect_files = ["package.json" ".node-version"];
       detect_extensions = ["js" "mjs" "cjs" "ts" "mts" "cts"];
       ignore_timeout = true;
     };
     
     os = {
       disabled = false;
       style="fg:green";
     };
     
     os.symbols = {
       Alpine = " ";
       Amazon = " ";
       Android = " ";
       Arch = " ";
       CentOS = " ";
       Debian = " ";
       DragonFly = " ";
       Emscripten = " ";
       EndeavourOS = " ";
       Fedora = " ";
       FreeBSD = " ";
       Garuda = "﯑ ";
       Gentoo = " ";
       HardenedBSD = "ﲊ ";
       Illumos = " ";
       Linux = " ";
       Macos = " ";
       Manjaro = " ";
       Mariner = " ";
       MidnightBSD = " ";
       Mint = " ";
       NetBSD = " ";
       NixOS = " ";
       OpenBSD = " ";
       openSUSE = " ";
       OracleLinux = " ";
       Pop = " ";
       Raspbian = " ";
       Redhat = " ";
       RedHatEnterprise = " ";
       Redox = " ";
       Solus = "ﴱ ";
       SUSE = " ";
       Ubuntu = " ";
       Unknown = " ";
     };
     
     package = {
       symbol = " ";
     };
     
     python = {
       symbol = " ";
     };
     
     ruby = {
       symbol = " ";
     };
     
     rust = {
       symbol = " ";
     };
     
     scala = {
       symbol = " ";
     };
    };
  };


programs.starship = {
 enable = true;
 settings = {
 format = ''
 [╭─󰧂 ](fg:#DA627D)\
 $directory\
 $git_branch\
 $git_status\
 $c\
 ${custom.elixir}\
 $elm\
 $golang\
 $haskell\
 $java\
 $julia\
 ${custom.nodejs}\
 $nim\
 $rust\
 $fill \
 $aws \
 $username\
 $hostname\
 $os \
 $memory_usage\
 $cmd_duration\
 $line_break\
 [╰─](fg:#DA627D)\
 $shell\
 $jobs\
 $character
 '';
 
 command_timeout = 200;
 add_newline = false;
 
 character = {
   success_symbol = "[](bold fg:cyan)";
   error_symbol = "[](bold fg:red)";
 };
 
 shell = {
   style = "fg:#DA627D";
   format = "[$indicator ]($style)";
   disabled = false;
   fish_indicator = "󰈺";
   zsh_indicator = "󰰸";
   bash_indicator = "";
 };
 
 fill = {
   symbol = " ";
   style = "fg:bright-white";
 };
 
 jobs = {
   style = "fg:yellow";
   symbol = "󰑮 ";
   format = "[$symbol$number]($style) ";
 };
 
 cmd_duration = {
   min_time = 0;
   format = "[󱎫 $duration]($style) ";
 };
 
 username = {
   show_always = true;
   style_user = "fg:purple";
   style_root = "fg:purple";
   format = '[$user󰓺 ]($style) ';
   disabled = false;
 };
 
 aws = {
   # format="[$symbol$profile 󰍎$region]($style)";
   format="[$symbol$profile]($style)";
   symbol = " ";
   # symbol = "☁️ ";
 };
 
 "aws.region_aliases" = {
   # us-west-2= "pdx";
   # us-east-1= "iad";
   # eu-west-1= "dub";
   # eu-central-1= "fra";
   # ca-central-1= "iad";
 };
 
 ssh_symbol = "SSH";
 
 hostname = {
   ssh_only = false;
   style="fg:green";
   format = '[󰒍 $ssh_symbol$hostname ]($style)';
   disabled = false;
 };
 
 director = {
   format = "[$path ]($style) ";
   truncation_length = 2;
   truncation_symbol = "… /";
   truncate_to_repo = false;
 };
 
 "directory.substitutions" = {
   "Documents" = " ";
   "Downloads" = " ";
   "Music" = " ";
   "Pictures" = " ";
 };
 
 docker_context = {
   symbol = " ";
   style = "";
   format = '[$symbol $context ]($style) $path';
 };
 
 "custom.elixir" = {
   shell = ["rg", "-N", "elixir ", ".tool-versions", "-r", ""];
   symbol = "";
   format = '[$symbol ($output) ]($style)';
   detect_files = ["mix.exs"];
 };
 
 time = {
   disabled = true;
   time_format = "%R" # Hour:Minute Format;
   style = "bg:#33658A";
   format = '[[♥ $time ](bg:#33658A)]($style)';
 };
 
 elixir = {
   symbol = " ";
 };
 
 git_branch = {
   format = '[$symbol$branch ]($style)';
   symbol = " ";
 };
 
 git_status = {
   format = '[($all_status$ahead_behind) ]($style)';
   ahead = '⇡${count}';
   diverged = '⇕⇡${ahead_count}⇣${behind_count}';
   behind = '⇣${count}';
 };
 
 golang = {
   symbol = " ";
 };
 
 haskell = {
   symbol = " ";
 };
 
 hg_branch = {
   symbol = " ";
 };
 
 java = {
   symbol = " ";
 };
 
 julia = {
   symbol = " ";
 };
 
 lua = {
   symbol = " ";
 };
 
 memory_usage = {
   symbol = "󰤇 ";
   threshold = 0;
   disabled = false;
   format = '$symbol[${ram_pct}]($style) ';
 };
 
 nim = {
   symbol = " ";
   format = "[$symbol $version]($style)";
 };
 
 nix_shell = {
   symbol = " ";
 };
 
 nodejs = {
   symbol = " ";
 };
 
 custom.nodejs = {
   shell = ["node", "--version"];
   symbol = "";
   format = '[$symbol ($output) ]($style)';
   detect_files = ["package.json", ".node-version"];
   detect_extensions = ["js", "mjs", "cjs", "ts", "mts", "cts"];
   ignore_timeout = true;
 };
 
 os = {
   disabled = false;
   style="fg:green";
 };
 
 os.symbols = {
   Alpine = " ";
   Amazon = " ";
   Android = " ";
   Arch = " ";
   CentOS = " ";
   Debian = " ";
   DragonFly = " ";
   Emscripten = " ";
   EndeavourOS = " ";
   Fedora = " ";
   FreeBSD = " ";
   Garuda = "﯑ ";
   Gentoo = " ";
   HardenedBSD = "ﲊ ";
   Illumos = " ";
   Linux = " ";
   Macos = " ";
   Manjaro = " ";
   Mariner = " ";
   MidnightBSD = " ";
   Mint = " ";
   NetBSD = " ";
   NixOS = " ";
   OpenBSD = " ";
   openSUSE = " ";
   OracleLinux = " ";
   Pop = " ";
   Raspbian = " ";
   Redhat = " ";
   RedHatEnterprise = " ";
   Redox = " ";
   Solus = "ﴱ ";
   SUSE = " ";
   Ubuntu = " ";
   Unknown = " ";
 };
 
 package = {
   symbol = " ";
 };
 
 python = {
   symbol = " ";
 };
 
 ruby = {
   symbol = " ";
 };
 
 rust = {
   symbol = " ";
 };
 
 scala = {
   symbol = " ";
 };
}


# 󱗿 󱗽    󰗗   󰒋 󰒍 󰷵 󰤇  
#        󰍟             󰁕 󰁖 󰁗 󰁘 󰁚 󰄾 󰅂 󰍟 󰓺 󰔰 󰘠 󰛂 󰛂 󰛂 󰜴 󰜵 󰞘 󰦥 󰧂 󰧚 󰧛 󰬪 󰬪 󰮺 󰳟 󰶻 󰷵 󱦰 
# bright-black, bright-red, bright-green, bright-blue, bright-yellow, bright-purple, bright-cyan, bright-white

