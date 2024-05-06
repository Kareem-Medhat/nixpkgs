{ buildGoModule
, fetchFromGitHub
, lib
}:

buildGoModule rec {
  pname = "hishtory";
  version = "0.293";

  src = fetchFromGitHub {
    owner = "ddworken";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-5I61ey7GJ78dhSgRMkbRcKf3zk0j7zW2MyN2QSbAnpE=";
  };

  vendorHash = "sha256-zTwZ/sMhQdlf7RYfR2/K/m08U1Il0VQmYFyNNiYsWhc=";

  ldflags = [ "-X github.com/ddworken/hishtory/client/lib.Version=${version}" ];

  subPackages = [ "." ];

  excludedPackages = [ "backend/server" ];

  postInstall = ''
    mkdir -p $out/share/hishtory
    cp client/lib/config.* $out/share/hishtory
  '';

  doCheck = true;

  meta = with lib; {
    description = "Your shell history: synced, queryable, and in context";
    homepage = "https://github.com/ddworken/hishtory";
    license = licenses.mit;
    maintainers = with maintainers; [ Enzime ];
    mainProgram = "hishtory";
  };
}

