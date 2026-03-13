{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  sphinx,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinx-filter-tabs";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_filter_tabs";
    inherit (finalAttrs) version;
    hash = "sha256-NgKFGLXRYav+htClHnr9e/K1v79hHXV9bHrS4K3sTNg=";
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
    homepage = "https://pypi.org/project/sphinx-filter-tabs";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
