{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-filter-tabs";
  version = "1.4.3";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_filter_tabs";
    inherit version;
    hash = "sha256-/gAauQm1C1actbtminPwMW97jSGKByyEMCd2Sq3IGts=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    sphinx
  ];

  pythonImportsCheck = [
    "filter_tabs"
  ];

  meta = {
    description = "A Sphinx extension for accessible, CSS-first filterable content tabs";
    homepage = "https://pypi.org/project/sphinx-filter-tabs/";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
}
