{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  sphinx,
  build,
  twine,
  flake8,
  pytest,
  pytest-cov,
  pytest-flake8,
  pytest-isort,
}:

buildPythonPackage rec {
  pname = "sphinx-csv-filter";
  version = "0.4.2";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_csv_filter";
    inherit version;
    hash = "sha256-5tFhTKMNhUA6XOZo9jSKmu7KuL9yOKPRNyPTxW6dqjQ=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    sphinx
  ];

  optional-dependencies = {
    development = [
      build
      setuptools
      twine
      wheel
    ];
    testing = [
      flake8
      pytest
      pytest-cov
      pytest-flake8
      pytest-isort
    ];
  };

  pythonImportsCheck = [
    "csv"
  ];

  meta = {
    description = "A CSV filter directive for docutils and Sphinx, that extends the \"csv-table\" reStructuredText directive to add row filtering options";
    homepage = "https://pypi.org/project/sphinx-csv-filter";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
