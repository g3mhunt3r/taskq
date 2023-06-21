{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.tq = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.stdenv.mkDerivation rec {
      pname = "tq";
      version = "1.0";
      src = ./.;
      propagatedBuildInputs = [ pkgs.python3 ];
      doCheck = false;
      installPhase = ''
        mkdir -p $out/bin
        cp $src/tq $out/bin/
        chmod +x $out/bin/tq
      '';
    };

    packages.x86_64-linux.default = self.packages.x86_64-linux.tq;

  };
}
