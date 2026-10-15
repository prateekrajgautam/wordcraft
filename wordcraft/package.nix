{
  lib,
  appimageTools,
  fetchurl,
}:

let
  pname = "wordcraft";
  version = "2026.10.09-a300702";

  src = fetchurl {
    url = "https://github.com/storytold/craft-launcher/releases/download/v0.3.2/artcraft-launcher-0.3.2-linux-x86_64.AppImage";
    hash = "sha256-ftxw2jW/IUoiFSh5SLj9piCz3+VQdq7Fbo12vhpoqLU=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  # The AppImage contains its own application files.
  # Add extra runtime libraries here only if required.
  extraPkgs = pkgs: [ ];

  meta = {
    description = "WordCraft desktop application";
    homepage = "https://getartcraft.com/apps/wordcraft";
    license = lib.licenses.agpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = "wordcraft";
  };
}
