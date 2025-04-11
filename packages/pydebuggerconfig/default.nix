{
  lib,
  fetchPypi,
  buildPythonPackage,
  pyedbglib,
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

  propagatedBuildInputs = [ pyedbglib ];
}
