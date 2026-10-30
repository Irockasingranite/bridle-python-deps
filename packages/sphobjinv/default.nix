{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  attrs,
  certifi,
  jsonschema,
}:

buildPythonPackage rec {
  pname = "sphobjinv";
  version = "2.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RNV+fofhfYx7BTyFPcw2+Ay/fR/BUtV2NP17yuOMpIo=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    attrs
    certifi
    jsonschema
  ];

  pythonImportsCheck = [
    "sphobjinv"
  ];

  meta = {
    description = "Sphinx objects.inv Inspection/Manipulation Tool";
    homepage = "https://pypi.org/project/sphobjinv/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
