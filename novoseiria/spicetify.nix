{ pkgs, ... }:

let
	spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
	programs.spicetify = {
		enable = true;
		enabledExtensions = with spicePkgs.extensions; [
			adblock
			aiBandBlocker
			autoSkipVideo
			fullAppDisplay
			hidePodcasts
			playNext
			queueTime
			shuffle
			volumePercentage
		];
	};
}
