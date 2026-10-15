{
  description = "A Nix flake for WordCraft";

  inputs = {
    # Pin the Nix package collection used to build WordCraft.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Start with the common 64-bit Intel/AMD Linux architecture.
      system = "x86_64-linux";

      # Import nixpkgs for this architecture.
      pkgs = import nixpkgs { inherit system; };

      # Evaluate the package expression with its dependencies.
      wordcraft = pkgs.callPackage ./wordcraft/package.nix { };
    in
    {
      # Export the package under a named attribute.
      packages.${system} = {
        inherit wordcraft;

        # Makes `nix build` select WordCraft by default.
        default = wordcraft;
      };
    };
}
