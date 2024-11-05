{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  alabaster,
  babel,
  colorama,
  docutils,
  imagesize,
  jinja2,
  packaging,
  pygments,
  requests,
  snowballstemmer,
  sphinxcontrib-applehelp,
  sphinxcontrib-devhelp,
  sphinxcontrib-htmlhelp,
  sphinxcontrib-jsmath,
  sphinxcontrib-qthelp,
  sphinxcontrib-serializinghtml,
  tomli,
}:

buildPythonPackage rec {
  pname = "sphinx";
  version = "8.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Q8GRHuyw0+FhrXhhG8kF0a0OUj5N3CAqWKghdz3EySc=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    alabaster
    babel
    colorama
    docutils
    imagesize
    jinja2
    packaging
    pygments
    requests
    snowballstemmer
    sphinxcontrib-applehelp
    sphinxcontrib-devhelp
    sphinxcontrib-htmlhelp
    sphinxcontrib-jsmath
    sphinxcontrib-qthelp
    sphinxcontrib-serializinghtml
    tomli
  ];

  dontCheck = true;

  pythonRelaxDeps = [
    "sphinxcontrib-htmlhelp"
  ];

  meta = {
    description = "Python documentation generator";
    homepage = "https://pypi.org/project/Sphinx/";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ ];
  };
}
