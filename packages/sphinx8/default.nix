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
  roman-numerals,
  snowballstemmer,
  sphinxcontrib-applehelp,
  sphinxcontrib-devhelp,
  sphinxcontrib-htmlhelp,
  sphinxcontrib-jsmath,
  sphinxcontrib-qthelp,
  sphinxcontrib-serializinghtml,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinx";
  version = "9.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-WU71nQQpcqu8WB2Lqld0BKvk5sOwTvYb1/wqy9UfP6M=";
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
    roman-numerals
    snowballstemmer
    sphinxcontrib-applehelp
    sphinxcontrib-devhelp
    sphinxcontrib-htmlhelp
    sphinxcontrib-jsmath
    sphinxcontrib-qthelp
    sphinxcontrib-serializinghtml
  ];

  pythonImportsCheck = [
    "sphinx"
  ];

  meta = {
    description = "Python documentation generator";
    homepage = "https://pypi.org/project/Sphinx";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ ];
  };
})
