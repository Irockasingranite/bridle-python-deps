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
  version = "0.24.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hS6IryCH4Dzfns5pFvP1i3QZGrUcyAdIl5Ub1Jbufbs=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ruff_python_ast-0.0.0" = "sha256-jRH7OOT03MDomZAJM20+J4y5+xjN1ZAV27Z44O1qCEQ=";
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
