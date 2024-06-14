{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  enum34,
  six,
  typing,
}:

buildPythonPackage rec {
  pname = "nixnet";
  version = "0.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5bub8dY6jZfSYWwCnYSeXuflGgWotYFVtmWGb9cGDeY=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    enum34
    six
    typing
  ];

  pythonImportsCheck = [ "nixnet" ];

  meta = with lib; {
    description = "NI-XNET Python API";
    homepage = "https://pypi.org/project/nixnet/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
