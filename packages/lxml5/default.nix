{
  lib,
  buildPythonPackage,
  fetchPypi,
  cython,
  setuptools,
  wheel,
  cssselect,
  libxml2,
  libxslt,
  lxml-html-clean,
  html5lib,
  beautifulsoup4,
  zlib,
}:

buildPythonPackage rec {
  pname = "lxml5";
  version = "5.3.2";
  pyproject = true;

  src = fetchPypi {
    pname = "lxml";
    inherit version;
    hash = "sha256-dzlH0O2AndrYJLexRGfhpIG4l26HJ4rEpzDC98f83cE=";
  };

  nativeBuildInputs = [
    libxml2.dev
    libxslt.dev
  ];

  build-system = [
    cython
    setuptools
    wheel
  ];

  buildInputs = [
    zlib
  ];

  optional-dependencies = {
    cssselect = [
      cssselect
    ];
    html-clean = [
      lxml-html-clean
    ];
    html5 = [
      html5lib
    ];
    htmlsoup = [
      beautifulsoup4
    ];
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-quiet 'Cython>=3.0.11, < 3.1.0' 'Cython>=3.0.11'
  '';

  pythonImportsCheck = [
    "lxml"
    "lxml.etree"
  ];

  meta = {
    description = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API";
    homepage = "https://pypi.org/project/lxml/";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
