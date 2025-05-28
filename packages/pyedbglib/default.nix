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

  meta = {
    description = "pyedbglib is a low-level protocol library for communicating with Microchip CMSIS-DAP based debuggers";
    homepage = "https://pypi.org/project/pyedbglib/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
