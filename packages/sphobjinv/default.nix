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
  version = "2.3.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-odUeTPPZaLng0+0cvM6gBx5eV5XySi10AaTjfWvXVxc=";
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
