{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyusb,
  pyyaml,
  appdirs,
  pyedbglib,
  pydebuggerconfig,
}:

buildPythonPackage rec {

  pname = "pykitinfo";
  version = "1.4.1.26";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-AIJth/iyVBBtBRkjINPbivPk6rHqmsjV7sfYC02pofU=";
  };

  format = "wheel";

  propagatedBuildInputs = [
    pyusb
    pyyaml
    appdirs
    pyedbglib
    pydebuggerconfig
  ];

  meta = {
    description = "pykitinfo provides information about connected Microchip development kits and tools";
    homepage = "https://pypi.org/project/pykitinfo/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pykitinfo";
  };
}
