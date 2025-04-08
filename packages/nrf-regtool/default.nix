{
  lib,
  python3,
  fetchPypi,
  svada,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "nrf-regtool";
  version = "9.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "nrf_regtool";
    inherit version;
    hash = "sha256-DEs+GCUbgXBnOVBqZPhXARJZvdbTlv9Wxc1c43meZM4=";
  };

  build-system = [
    python3.pkgs.hatch-vcs
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    intelhex
    svada
  ];

  optional-dependencies = with python3.pkgs; {
    cli = [
      pydantic
      tomlkit
    ];
  };

  pythonImportsCheck = [];

  meta = {
    description = "Generate register content for memory-mapped peripherals";
    homepage = "https://pypi.org/project/nrf-regtool/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "nrf-regtool";
  };
}
