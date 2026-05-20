{ config, pkgs, ... }:

{
	system.stateVersion = "26.05";

	imports = [
		./hardware-configuration.nix
	];

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];

	networking = {
		hostName = "novoseiria-nixos";
		networkmanager.enable = true;
	};

	time.timeZone = "Asia/Manila";

	i18n.defaultLocale = "en_US.UTF-8";

	users = {
		mutableUsers = false;

		users.novoseiria = {
			isNormalUser = true;
			description = "Nile Jocson";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
			hashedPassword = "$y$j9T$oZCbCzeiB9V8bTD.tTJxA0$ydr/nGlKPkNvf4aIqgZ2kuLRe61quX23gIVYR8GRHF3";
		};
	};

	nixpkgs.config.allowUnfree = true;

	security.polkit.enable = true;

	environment.systemPackages = with pkgs; [
		gcc
		clang
		clang-tools
		cmake
		vim
		tmux
		brightnessctl
		lxsession
		tree
	];

	services = {
		openssh.enable = true;
		xserver = {
			enable = true;
			displayManager.startx.enable = true;
			xkb = {
				layout = "us";
				variant = "";
			};
		};
		displayManager.ly.enable = true;
		gvfs.enable = true;
		flatpak.enable = true;
	};

	programs = {
		dconf.enable = true;
		gnupg.agent = {
			enable = true;
			pinentryPackage = pkgs.pinentry-qt;
		};
		thunar = {
			enable = true;
			plugins = pkgs.xfce.thnunar-archive-plugin;
		};
		steam.enable = true;
	}
}
