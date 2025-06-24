{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyedbglib,
}:

buildPythonPackage rec {

  pname = "pymcuprog";
  version = "3.19.4.61";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-Zr6HC27btBNEPn+lmIK21FBMO52KreyoXFXoNFnWRAg=";
  };

  format = "wheel";

  propagatedBuildInputs = [ pyedbglib ];

  meta = {
    description = "pymcuprog is a utility for programming various Microchip MCU devices using Microchip CMSIS-DAP based debuggers";
    homepage = "https://pypi.org/project/pymcuprog/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pymcuprog";
  };
}
