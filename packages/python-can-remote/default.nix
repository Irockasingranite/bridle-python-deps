{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  python-can,
}:

buildPythonPackage rec {
  pname = "python-can-remote";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    pname = "python_can_remote";
    inherit version;
    hash = "sha256-wfnUmcsQ2BwQ75JPRw2+SAA18qK8eK/M1NZxNJ5Lz3o=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    python-can
  ];

  meta = {
    description = "CAN over network bridge for Python";
    homepage = "https://pypi.org/project/python-can-remote/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
