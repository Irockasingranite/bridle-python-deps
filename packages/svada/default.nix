{
  lib,
  python,
  fetchPypi,
  lxml5,
}:

python.pkgs.buildPythonApplication rec {
  pname = "svada";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iI1p2++qIdxztb5Jvuggt6nAUnPwgYk4+7zYAuD0nE4=";
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
    lxml5
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
