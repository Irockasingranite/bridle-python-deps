{
  lib,
  python,
  fetchPypi,
  svada,
}:

python.pkgs.buildPythonApplication rec {
  pname = "nrf-regtool";
  version = "9.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "nrf_regtool";
    inherit version;
    hash = "sha256-bs9PhC9WC9dzckmWF78kdFs1sQszAlXYSr2kWRxvyuk=";
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
