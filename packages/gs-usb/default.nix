{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  pyusb,
}:

buildPythonPackage rec {
  pname = "gs-usb";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "gs_usb";
    inherit version;
    hash = "sha256-H0iP180J11Pf90t9BTSfB5M9xVaETjzZ3wLE5LdGv48=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [ pyusb ];

  pythonImportsCheck = [ "gs_usb" ];

  meta = with lib; {
    description = "Python Windows/Linux/Mac CAN driver based on usbfs or WinUSB WCID for Geschwister Schneider USB/CAN devices and candleLight USB CAN interfaces";
    homepage = "https://pypi.org/project/gs-usb/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
