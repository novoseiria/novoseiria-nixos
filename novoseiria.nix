{ config, pkgs, terminal, ... }:

{
	home = {
		stateVersion = "26.05";
		username = "novoseiria";
		homeDirectory = "/home/novoseiria";
		packages = with pkgs; [
			# fonts
			iosevka
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-color-emoji

			# downloads
			qbittorrent
			nicotine-plus

			# audio
			ffmpeg_7-full
			flacon
			sacd
			kid3-qt
			rsgain
			ardour
			lsp-plugins
			qpwgraph
			musescore

			# coding
			gdb
			lldb
			typst
			tinymist
			rustup
			zola

			# images & video
			krita
			inkscape
			vlc

			# passwords
			gopass
			gopass-hibp

			# misc.
			rsync
			xev
			btop
			smartmontools
			flameshot
			peazip
			ungoogled-chromium
			ltspice
			xclicker
		];

		file = {
			".bashrc".source = ./dotfiles/.bashrc;
			".fehbg".source = ./dotfiles/.fehbg;
			".xinitrc".source = ./dotfiles/.xinitrc;
			"bg.png".source = ./dotfiles/bg.png;
			"Music".source = config.lib.file.mkOutOfStoreSymlink "/home/novoseiria/archive/Music";
		};
	};

	fonts.fontconfig.enable = true;

	xdg.userDirs = {
		enable = true;
		createDirectories = true;
	};

	programs = {
		rofi = {
			enable = true;
			inherit terminal;
		};

		gh.enable = true;

		kitty = {
			enable = true;
			font.name = "Iosevka Extended";
			font.size = 10;
		};

		vesktop = {
			enable = true;
			settings = {
				arRPC = true;
				minimizeToTray = true;
				discordBranch = "stable";
			};
		};

		rmpc.enable = true;

		feh.enable = true;
	};

	services.mpd-discord-rpc.enable = true;

	imports = [
		./novoseiria/i3.nix
		./novoseiria/git.nix
		./novoseiria/firefox.nix
		./novoseiria/vscode.nix
		./novoseiria/easyeffects.nix
		./novoseiria/mpd.nix
		./novoseiria/flatpak.nix
	];
}
