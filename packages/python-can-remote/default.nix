{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "python-can-remote";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-d+wIE3WD/TLoGxtI4+gv0EOTUTifbw0RTX5QmhbnlRc=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [ "python_can_remote" ];

  meta = with lib; {
    description = "CAN over network bridge for Python";
    homepage = "https://pypi.org/project/python-can-remote/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
