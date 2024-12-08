{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flakeUtils.url = "github:numtide/flake-utils";
  };
  outputs =
    { self
    , nixpkgs
    , flakeUtils
    }:
    flakeUtils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };

      shellInput = with pkgs; [
        # nix
        nixpkgs-fmt
        nil
        statix
        deadnix

        yaml-language-server
      ];
    in
    {
      devShells.default = pkgs.mkShell rec {
        packages = shellInput;
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath packages;
      };
    }
    );
}
