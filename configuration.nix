{ config, lib, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	networking.hostName = "Snixxy";
	networking.networkmanager.enable = true;

	time.timeZone = "Asia/Ulaanbaatar";

	services.xserver.windowManager.dwm = {
		enable = true;
		package = pkgs.dwm.overrideAttrs {
			src = /home/achka/.config/dwm;
		};
	};

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	services.xserver.enable = true;
	services.xserver.xkb.options = "ctrl:nocaps";
	services.libinput = {
		enable = true;
 		touchpad = {
			naturalScrolling = true;
			scrollMethod = "twofinger";
		};
	};
	services.displayManager.ly.enable = true;

	#what are these? services that make file managers way better
	services.gvfs.enable = true;
	services.udisks2.enable = true;

	users.users.achka = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [ vim git ];
	programs.xss-lock.enable = true;
	programs.slock.enable = true;

	fonts.packages = with pkgs; [
		liberation_ttf
		nerd-fonts.jetbrains-mono
		nerd-fonts.iosevka
		nerd-fonts.fira-code
		nerd-fonts.code-new-roman
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "26.05";
}

