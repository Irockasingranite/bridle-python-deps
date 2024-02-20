{ lib
, fetchPypi
, buildPythonPackage
, pyusb
, pyyaml
, appdirs
, pyedbglib
, pydebuggerconfig
}:

buildPythonPackage rec {

  pname = "pykitinfo";
  version = "0.4.0.6";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    sha256 = "sha256-XT9vVcIxr5dWEKXpOahIOX9BsUPqqmnNneQeH4DiUPw=";
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
