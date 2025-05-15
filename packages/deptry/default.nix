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
  version = "0.23.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SRWjWQzPOK16kXau43Z0WqneEh9Q+NqPuczsh/qT5nY=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ruff_python_ast-0.0.0" = "sha256-V05GUo5nA6RhVWD7mn94GF3/93In3cnljd2G3hPeBZ0=";
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
