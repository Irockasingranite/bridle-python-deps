{ lib
, fetchPypi
, buildPythonPackage
}:

buildPythonPackage rec {
  pname = "doxmlparser";
  version = "1.10.0";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    sha256 = "sha256-XkzyVwVAWVoygoDAymV7UaCDUNPxTBqfWoQC9TQ3aDU=";
    python = "py3";
    dist = "py3";
  };

  format = "wheel";
}
