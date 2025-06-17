{
  lib,
  fetchPypi,
  buildPythonPackage,
  lxml,
  six,
}:

buildPythonPackage rec {
  pname = "doxmlparser";
  version = "1.13.2";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    sha256 = "sha256-ZasSbn0/d7G7FfpohmY2FPaNBHO0iDHh+4IvUzJD62g=";
    python = "py3";
    dist = "py3";
  };

  format = "wheel";

  dependencies = [
    lxml
    six
  ];

  meta = {
    description = "This is a python package to make it easier to parse the XML output produced by doxygen.";
    homepage = "https://pypi.org/project/doxmlparser/";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ ];
  };
}
