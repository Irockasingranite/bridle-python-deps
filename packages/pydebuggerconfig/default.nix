{ lib
, fetchPypi
, buildPythonPackage
, pyedbglib
}:

buildPythonPackage rec {

  pname = "pydebuggerconfig";
  version = "3.9.2.121";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-SrGDaWW0Or8AFwb148xOGfKQuTv3ZoacU3rZFrk8tvM=";
  };

  format = "wheel";

  propagatedBuildInputs = [
    pyedbglib
  ];
}
