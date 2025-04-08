{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
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
    six
    typing
  ];

  postPatch = ''
    substituteInPlace nixnet/*/*.py \
      --replace-quiet 'collections.Mapping' 'collections.abc.Mapping' \
      --replace-quiet 'collections.Sequence' 'collections.abc.Sequence' \
  '';

  pythonImportsCheck = [ "nixnet" ];

  meta = with lib; {
    description = "NI-XNET Python API";
    homepage = "https://pypi.org/project/nixnet/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
