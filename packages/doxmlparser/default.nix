{
  lib,
  fetchPypi,
  buildPythonPackage,
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
}
