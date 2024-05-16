{
  lib,
  fetchPypi,
  buildPythonPackage,
  pythonRelaxDepsHook,
  setuptools,
  docutils,
  sphinx,
}:

buildPythonPackage rec {

  pname = "sphinx-csv-filter";
  version = "0.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-9jsTa0SOnk+fs4n9asKwUTqJT0dePHmlkb7lnD5w7UI=";
  };

  format = "pyproject";
  nativeBuildInputs = [
    setuptools
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = [
    docutils
    sphinx
  ];

  # package isn't actually broken with docutils >=0.19
  pythonRelaxDeps = [ "docutils" ];
}
