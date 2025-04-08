{
  lib,
  python3,
  fetchPypi,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "svada";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-F46QnoMX0MqrrBaQhkKavzXq62ZCXkv3kbQD0Nv+Wmc=";
  };

  build-system = [
    python3.pkgs.hatch-vcs
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    lxml
    numpy_2
    typing-extensions
  ];

  optional-dependencies = with python3.pkgs; {
    cli = [
      intelhex
      tomlkit
    ];
  };

  pythonImportsCheck = [];

  meta = {
    description = "SVD parsing for Python";
    homepage = "https://pypi.org/project/svada/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "svada";
  };
}
