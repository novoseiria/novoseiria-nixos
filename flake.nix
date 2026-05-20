{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-flatpak.url = "github:gmodena/nix-flatpak";

		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ nixpkgs, home-manager, nix-flatpak, nur, ... }: {
		nixosConfigurations.novoseiria-nixos = nixpkgs.lib.nixosSystem {
			modules = [
				./configuration.nix

				home-manager.nixosModules.home-manager {
					home-manager = {
						backupFileExtension = "backup";
						useGlobalPkgs =  true;
						useUserPackages = true;
						users.novoseiria.imports = [
							nix-flatpak.homeManagerModules.nix-flatpak
							./novoseiria.nix
						];
						extraSpecialArgs = {
							terminal = "kitty";
							modifier = "Mod4";
						};
					};
				}
			];
		};
	};
}
