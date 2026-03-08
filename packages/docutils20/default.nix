{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "docutils";
  version = "0.20.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8IpOJ2w6FYOobc4+NKuj/gTQK7ot1R7RYQYkToqSPjs=";
  };

  build-system = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [
    "docutils"
  ];

  meta = {
    description = "Docutils -- Python Documentation Utilities";
    homepage = "https://pypi.org/project/docutils/";
    license = with lib.licenses; [
      bsd2
      gpl3Only
    ];
    maintainers = with lib.maintainers; [ ];
  };
}
