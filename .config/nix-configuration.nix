{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
			<home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

	#networking
  networking.hostName = "clank"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    curl
    dconf
    dunst
    fzf
    eza
    git
    hyprpaper
    ripgrep
    pamixer
    pavucontrol
    starship
    wezterm
    wofi
    xdg-desktop-portal-hyprland
    xwayland
    fishPlugins.forgit
    fishPlugins.fzf-fish
  ];


  environment.shellAliases = {
    l1 = "exa --oneline";
    la = "exa --all --long --header --classify --git";
    lg = "exa --long --header --classify --git -s modified --grid";
    ls = "exa --long --header --classify --git";
    lsd = "exa --only-dirs --long --header --git";
  };

  programs.waybar = {
    enable = true;
  };

  programs.fish = {
    enable = true;

    shellAbbrs = {
      dlg = "yadm log --graph --oneline --decorate --color --all";
      dot = "yadm";
      dst = "yadm status";
      e = "exercism";
      g = "glab";
      gamend = "git commit --amend -C HEAD";
      gap = "git add --patch";
      gb = "git branch";
      gc = "git commit -v";
      gcl = "git clean -f -d";
      gco = "git checkout";
      gd = "git diff";
      gdc = "git diff --cached";
      gelete = "git branch --merged | rg -v main -N | xargs git branch -d";
      glg = "git log --graph --oneline --decorate --color --all";
      glod = "git log --oneline --decorate";
      gush = "git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease";
      gull = "git pull --rebase origin (git rev-parse --abbrev-ref HEAD)";
      gow = "git show";
      gra = "git rebase --abort";
      grc = "git rebase --continue";
      gst = "git status";
      gwip = "git commit -m WIP";
      nd = "op run --env-file .env -- nomad";
      pm = "podman";
      t = "terraform";
      tf = "op run --env-file .env -- terraform";
    };
  };

  users.defaultUserShell = pkgs.fish;

  users.users.micah = {
    isNormalUser = true;
    description = "Micah Cooper";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      thunderbird
    ];
  };

	home-manager.users.micah = {pkgs, ...}: {
		programs.git = {
			enable = true;
			userEmail = "micah+github@mrmicahcooper.com";
			userName = "mrmicahcooper";
		};
		home.stateVersion = "23.11";
	};

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["micah"];
  };

  programs.starship = {
   enable = true;
   settings = pkgs.lib.importTOML ./starship.toml;
  };

  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fonts.packages = with pkgs; [
   noto-fonts
   noto-fonts-cjk
   noto-fonts-emoji
   liberation_ttf
   fira-code
   fira-code-symbols
   maple-mono-NF
   mplus-outline-fonts.githubRelease
   dina-font
   proggyfonts
   spotify
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
  };

  programs.ssh = {
    extraConfig = ''
    Host *
      IdentityAgent ~/.1password/agent.sock
    '';
  };

  #Don't change this
  system.stateVersion = "23.11";

}
