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
  version = "2.3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-R8YD/v0xUP1ZSzxo/qv6odKPSme3A0lBVMrIp0R6pIM=";
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
