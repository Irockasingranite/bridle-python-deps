{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  python-can,
  parameterized,
  pytest,
}:

buildPythonPackage rec {
  pname = "python-can-sontheim";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zQP/PK5xpqD0OQDV+kPPGQf9XJOQIjijUJr1hWoLrNs=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [ python-can ];

  passthru.optional-dependencies = {
    dev = [
      parameterized
      pytest
    ];
  };

  pythonImportsCheck = [ "python_can_sontheim" ];

  meta = with lib; {
    description = "A python-can interface driver for Sontheim Industrie Elektronik CAN bus interfaces";
    homepage = "https://pypi.org/project/python-can-sontheim/";
    license = licenses.lgpl3Only;
    maintainers = with maintainers; [ ];
  };
}
