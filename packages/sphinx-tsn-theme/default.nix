{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  sphinx-rtd-theme,
}:

buildPythonPackage rec {
  pname = "sphinx-tsn-theme";
  version = "2024.11.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_tsn_theme";
    inherit version;
    hash = "sha256-MAS5XaGmuOgWMmjq45itDxX359zOCFYgOE1BxIOrMrg=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    sphinx-rtd-theme
  ];

  pythonImportsCheck = [
    "sphinx_tsn_theme"
  ];

  meta = {
    description = "TiaC Systems Network (TSN) theme for Sphinx";
    homepage = "https://pypi.org/project/sphinx-tsn-theme/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
