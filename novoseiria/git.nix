{
	programs.git = {
		enable = true;
		settings = {
			user.name = "Nile Jocson";
			user.email = "novoseiria@gmail.com";
			user.signingkey = "FFFF84DE34F53287";
			init.defaultBranch = "main";
			commit.gpgSign = true;
			tag.gpgSign = true;
		};
	};
}
