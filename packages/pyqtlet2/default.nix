{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  qtpy,
  pyqt5,
  pyqtwebengine,
  pyqt6,
  pyqt6-webengine,
  pyside2,
  pyside6,
}:

buildPythonPackage rec {
  pname = "pyqtlet2";
  version = "0.9.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UbNhv7EwW2O0sQ/z+GGIHjvXiU7ZPp3eKU1bqKNHhPU=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [ qtpy ];

  passthru.optional-dependencies = {
    pyqt5 = [
      pyqt5
      pyqtwebengine
    ];
    pyqt6 = [
      pyqt6
      pyqt6-webengine
    ];
    pyside2 = [ pyside2 ];
    pyside6 = [ pyside6 ];
  };

  pythonImportsCheck = [ "pyqtlet2" ];

  meta = with lib; {
    description = "Bringing leaflet maps to Python Qt bindings";
    homepage = "https://pypi.org/project/pyqtlet2/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
