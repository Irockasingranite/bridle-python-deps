{ lib
, fetchPypi
, buildPythonPackage
}:

buildPythonPackage rec {
  pname = "bz";
  version = "1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-EHZ0cac1sNw30RkRjBdmgaEMpxI1xbulwGUhbsxPpLk=";
  };
}
