{ config, pkgs, ... }:

{
	home.username = "achka";
	home.homeDirectory = "/home/achka";
	home.stateVersion = "26.05";

	programs.bash = {
		enable = true;
		shellAliases = {
			import = "/home/achka/.config/CustomScript/GitCloning.sh";
			localssh = "/home/achka/.config/CustomScript/localSSH.sh";
			update = "/home/achka/.config/CustomScript/Update.sh";
		};
		initExtra = ''
			eval "$(starship init bash)"
			eval "$(direnv hook bash)"
		'';
	};

	programs.git = {
		enable = true;
		settings.user.email = "";
		settings.user.name = "";
	};

	home.packages = with pkgs; [
		picom
		direnv
		starship
		wget
		dmenu
		brave
		emacs
		nautilus
		lxappearance
		brightnessctl
		alacritty
		dunst
		playerctl
		pavucontrol
		nicotine-plus
		notify-desktop
	];
}
