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
  version = "1.1.2.19";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-5qAKjL+pztWNfRHC9Quxtt/DPvoyprhzkU5DEDOGAgA=";
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
