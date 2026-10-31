{
  lib,
  rustPackages,
  fetchFromGitHub,
  pkg-config,
  gitMinimal,
}:

rustPackages.rustPlatform.buildRustPackage (finalAttrs: {
  pname = "hawkeye";
  version = "7.2.0";

  src = fetchFromGitHub {
    owner = "korandoru";
    repo = "hawkeye";
    tag = "v${finalAttrs.version}";
    hash = "sha256-OQuSxdV2ESlLtcmAMa9WDj1r+pyAgiBuQeWnm3RRsfw=";
  };

  buildAndTestSubdir = "hawkeye";

  cargoHash = "sha256-TB+SUobB7iwW85BPDLAfq9D6pl/oX7ub9WyG9PQi85w=";

  nativeBuildInputs = [
    pkg-config
  ];

  nativeCheckInputs = [
    gitMinimal
  ];

  # The tests assert on warnings, so we need to make them visible.
  logLevel = "warn";

  meta = {
    homepage = "https://github.com/korandoru/hawkeye";
    description = "Simple license header checker and formatter, in multiple distribution forms";
    license = lib.licenses.asl20;
    mainProgram = "hawkeye";
    maintainers = with lib.maintainers; [ matthiasbeyer ];
  };
})
