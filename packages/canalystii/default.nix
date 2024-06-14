{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  pyusb,
}:

buildPythonPackage rec {
  pname = "canalystii";
  version = "0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dHHgnN+FxAf9Sn7g/U5t5xTrn8pXQ0vvv/ArgB3PD4Q=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [ pyusb ];

  pythonImportsCheck = [ "canalystii" ];

  meta = with lib; {
    description = "Python userspace driver for Canalyst-II USB CAN analyzer";
    homepage = "https://pypi.org/project/canalystii/";
    license = with licenses; [
      bsd2
      bsd3
    ];
    maintainers = with maintainers; [ ];
  };
}
