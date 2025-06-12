{
  description = "Arch Bootstrap Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05-small";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          ansible
          git
        ];
        shellHook = ''
          echo "Arch-Bootsrap is up and running 󱓞 "
          export LANG=en_US.UTF-8
          export DEVENV=Arch-Bootsrap
        '';
      };
    }
  );
}
