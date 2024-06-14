{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  setuptools,
  wheel,
  python-can,
  black,
  mypy,
  pipx,
  tox,
}:

buildPythonPackage rec {
  pname = "python-can-cvector";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zariiii9003";
    repo = "python-can-cvector";
    rev = "v${version}";
    hash = "sha256-Haf/ozR7YQa5w3dhYTaSEn//iHLAR5ubdPztfcr50YM=";
  };

  nativeBuildInputs = [
    cython
    setuptools
    wheel
  ];

  propagatedBuildInputs = [ python-can ];

  passthru.optional-dependencies = {
    dev = [
      black
      mypy
      pipx
      tox
    ];
  };

  pythonImportsCheck = [ "python_can_cvector" ];

  meta = with lib; {
    description = "Cython based implementation of python-can VectorBus";
    homepage = "https://github.com/zariiii9003/python-can-cvector";
    license = licenses.lgpl3Only;
    maintainers = with maintainers; [ ];
  };
}
