{ lib
, stdenv
, buildNpmPackage
, fetchFromGitHub
, pkg-config
, libsecret
, darwin
, python3
, testers
, vsce
}:

buildNpmPackage rec {
  pname = "vsce";
  version = "2.31.1";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "vscode-vsce";
    rev = "v${version}";
    hash = "sha256-VXZBuaJn0VGpq1sIwsp+OcYErYShTCcU/FnTgDHmf7g=";
  };

  npmDepsHash = "sha256-Ftf6m5gRcYnkYfRx9vUys9uax8pwyyjUbfw3am8WriA=";

  postPatch = ''
    substituteInPlace package.json --replace '"version": "0.0.0"' '"version": "${version}"'
  '';

  nativeBuildInputs = [ pkg-config python3 ];

  buildInputs = [ libsecret ]
    ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [ AppKit Security ]);

  makeCacheWritable = true;
  npmFlags = [ "--legacy-peer-deps" ];

  passthru.tests.version = testers.testVersion {
    package = vsce;
  };

  meta = with lib; {
    homepage = "https://github.com/microsoft/vscode-vsce";
    description = "Visual Studio Code Extension Manager";
    maintainers = with maintainers; [ aaronjheng ];
    license = licenses.mit;
    mainProgram = "vsce";
  };
}
