{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyedbglib,
  crcmod,
  intelhex,
  pyyaml,
  appdirs,
  xmlschema,
}:

buildPythonPackage rec {

  pname = "pydebuggerconfig";
  version = "3.11.2.44";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-loyNvJ66s0rtN/NmJ+sh/V/CobYEVDRUYsghDnoujNI=";
  };

  format = "wheel";

  propagatedBuildInputs = [
    pyedbglib
    crcmod
    intelhex
    pyyaml
    appdirs
    xmlschema
  ];

  meta = {
    description = "pydebuggerconfig is a utility for accessing the configuration information stored inside the PKOB nano on-board debugger, typically found on Curiosity Nano kits.";
    homepage = "https://pypi.org/project/pydebuggerconfig/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pydebuggerconfig";
  };
}
