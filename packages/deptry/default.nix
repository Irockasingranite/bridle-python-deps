{
  lib,
  python,
  fetchPypi,
  cargo,
  rustPlatform,
  rustc,
}:

python.pkgs.buildPythonApplication rec {
  pname = "deptry";
  version = "0.23.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XSPg7yXzxWQFwFODpHbt2lWURWPFxHo+kkntPshg04I=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ruff_python_ast-0.0.0" = "sha256-XuHVKxzXYlm3iEhdAVCyd62uNyb3jeJRl3B0hnvUzX0=";
    };
  };

  build-system = [
    cargo
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  dependencies = with python.pkgs; [
    click
    colorama
    packaging
    requirements-parser
    tomli
  ];

  pythonImportsCheck = [
    "deptry"
  ];

  meta = {
    description = "A command line utility to check for unused, missing and transitive dependencies in a Python project";
    homepage = "https://pypi.org/project/deptry/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "deptry";
  };
}
