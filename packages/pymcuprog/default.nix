{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyedbglib,
}:

buildPythonPackage rec {

  pname = "pymcuprog";
  version = "3.17.3.45";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-lOlWdYQ5frwwI37PhNpyTnz9N+87093AwhwdGLfZ7VY=";
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
