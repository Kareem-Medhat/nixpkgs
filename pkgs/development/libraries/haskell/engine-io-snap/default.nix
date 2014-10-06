# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, attoparsecEnumerator, engineIo, MonadCatchIOTransformers
, snapCore, unorderedContainers, websockets, websocketsSnap
}:

cabal.mkDerivation (self: {
  pname = "engine-io-snap";
  version = "1.0.2";
  sha256 = "0x2sb3b825ds1g2g15yyqxdrw6bh968ivmyd1933l47649qbs0xr";
  buildDepends = [
    attoparsecEnumerator engineIo MonadCatchIOTransformers snapCore
    unorderedContainers websockets websocketsSnap
  ];
  meta = {
    homepage = "http://github.com/ocharles/engine.io";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ ocharles ];
  };
})
