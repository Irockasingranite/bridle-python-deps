{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  sphinx,
  cairosvg,
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-svg2pdfconverter";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinxcontrib_svg2pdfconverter";
    inherit version;
    hash = "sha256-l1boLV878RYp/8uvsfihCS07tHieM0lAMs3OmpyEWdM=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    sphinx
  ];

  optional-dependencies = {
    CairoSVG = [
      cairosvg
    ];
  };

  pythonImportsCheck = [ ];

  meta = {
    description = "Sphinx SVG to PDF converter extension";
    homepage = "https://pypi.org/project/sphinxcontrib-svg2pdfconverter/";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ ];
  };
}
