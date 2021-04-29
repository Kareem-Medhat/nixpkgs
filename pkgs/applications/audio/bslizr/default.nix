{ lib, stdenv, fetchFromGitHub, xorg, cairo, lv2, pkg-config }:

stdenv.mkDerivation rec {
  pname = "BSlizr";
  version = "1.2.14";

  src = fetchFromGitHub {
    owner = "sjaehn";
    repo = pname;
    rev = version;
    sha256 = "sha256-dut3I68tJWQH+X6acKROqb5HywufeBQ4/HkXFKsA3hY=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    xorg.libX11 cairo lv2
  ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    homepage = "https://github.com/sjaehn/BSlizr";
    description = "Sequenced audio slicing effect LV2 plugin (step sequencer effect)";
    maintainers = [ maintainers.magnetophon ];
    platforms = platforms.linux;
    license = licenses.gpl3;
  };
}
