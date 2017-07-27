# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot = {
    loader = {
	grub = {
	  enable = true;
          version = 2;
          efiSupport = true;
          device = "/dev/sda";
	};
    };
    initrd.luks.devices = [
	{
		name = "root";
		device = "/dev/sda3";
		preLVM = true;
	}
    ];
  };
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking = {
    hostName = "carbonara"; # Define your hostname.
    networkmanager.enable = true;
    firewall.enable = true; 
  };
  
  #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "US/Eastern";


  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
     android-studio
     androidsdk
     busybox
     chromium
     idea.idea-community
     kops
     kubernetes
     minikube
     vim
     virtualbox
     wget
   ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.tyoma = {
     isNormalUser = true;
     uid = 1000;
     extraGroups = [ "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" ];
     createHome = true;
   };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
