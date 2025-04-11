{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyserial,
}:

buildPythonPackage rec {

  pname = "pyedbglib";
  version = "2.24.2.18";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-P+5Xm60Exx2oXeSi7Gj289S9i6ze1/s7ZxyIMe0zZsI=";
  };

  format = "wheel";

  propagatedBuildInputs = [ pyserial ];
}
