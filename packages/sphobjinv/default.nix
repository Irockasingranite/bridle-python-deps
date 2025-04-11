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
  version = "2.3.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HIdKNoRghRNS1FySr6FytcQmU7R+LnDXjWHayTMIqp0=";
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
