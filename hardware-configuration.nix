{ config, lib, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" ];
	boot.initrd.kernelModules = [];
	boot.kernelModules = [ "kvm-amd" ];
	boot.extraModulePackages = [];

	fileSystems."/" = {
		device = "/dev/disk/by-label/nixos";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-label/boot";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
	};

	fileSystems."/home/novoseiria/archive" = {
		device = "/dev/disk/by-label/archive";
		fsType = "ext4";
		options = [ "nofail" ];
	};

	swapDevices = [];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
