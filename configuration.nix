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
	
	#you may uncomment these for X11 tilers
	#programs.xss-lock.enable = true;
	#programs.xss-lock.lockerCommand = "/run/wrappers/bin/slock";
	#programs.slock.enable = true;

	services.power-profiles-daemon.enable = true;

	#same deal
	#services.xserver.enable = true;
	#services.xserver.xkb.options = "ctrl:nocaps";
	services.libinput = {
		enable = true;
		touchpad = {
			naturalScrolling = true;
			scrollMethod = "twofinger";
		};
		mouse = {
			accelProfile = "flat";
		};
	};
	services.displayManager.ly.enable = true;

	users.users.achka = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};

	environment.systemPackages = with pkgs; [ vim git ];

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

