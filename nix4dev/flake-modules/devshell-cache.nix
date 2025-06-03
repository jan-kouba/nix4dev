{
  perSystem = { config, pkgs, ...}: {
    packages.devshellCache = pkgs.mkBinaryCache {
      rootPaths = [ config.devShells.default ];
    };

    packages.checkCache = pkgs.mkBinaryCache {
      rootPaths = [ config.packages.check ];
    };
  };
}
