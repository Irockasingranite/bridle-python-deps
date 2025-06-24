{
  lib,
  python,
  fetchPypi,
  svada,
}:

python.pkgs.buildPythonApplication rec {
  pname = "nrf-regtool";
  version = "9.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "nrf_regtool";
    inherit version;
    hash = "sha256-ZPwsZxms4qP4EUaNCrNW5EUy+X7+B0mReBjFj7KvUDI=";
  };

  build-system = [
    python.pkgs.hatch-vcs
    python.pkgs.hatchling
  ];

  dependencies = with python.pkgs; [
    intelhex
    svada
  ];

  optional-dependencies = with python.pkgs; {
    cli = [
      pydantic
      tomlkit
    ];
  };

  meta = {
    description = "Generate register content for memory-mapped peripherals";
    homepage = "https://pypi.org/project/nrf-regtool/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "nrf-regtool";
  };
}
