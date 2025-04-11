{
  lib,
  python,
  fetchPypi,
}:

python.pkgs.buildPythonApplication rec {
  pname = "svada";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-F46QnoMX0MqrrBaQhkKavzXq62ZCXkv3kbQD0Nv+Wmc=";
  };

  # WORKAROUND: Remove version bound on hatchling
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-quiet 'hatchling<1.27.0' 'hatchling'
  '';

  build-system = [
    python.pkgs.hatch-vcs
    python.pkgs.hatchling
  ];

  dependencies = with python.pkgs; [
    lxml
    numpy_2
    typing-extensions
  ];

  optional-dependencies = with python.pkgs; {
    cli = [
      intelhex
      tomlkit
    ];
  };

  pythonImportsCheck = [ ];

  meta = {
    description = "SVD parsing for Python";
    homepage = "https://pypi.org/project/svada/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "svada";
  };
}
