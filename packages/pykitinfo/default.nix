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
}
