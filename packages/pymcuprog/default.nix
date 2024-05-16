{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyedbglib,
}:

buildPythonPackage rec {

  pname = "pymcuprog";
  version = "3.16.8.40";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-Yqkiww2mdL5BRyCO6IjbazCRIK2OLKQoQe0ooZmEhlk=";
  };

  format = "wheel";

  propagatedBuildInputs = [ pyedbglib ];
}
