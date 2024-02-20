{ lib
, fetchPypi
, buildPythonPackage
, pyserial
}:

buildPythonPackage rec {

  pname = "pyedbglib";
  version = "2.23.0.14";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-NOqJfS4Xk9lw5KWk99YVOcrW89slXYLFQUlTI8fiv+M=";
  };

  format = "wheel";

  propagatedBuildInputs = [
    pyserial
  ];
}
