{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  sphinx,
}:

buildPythonPackage rec {

  pname = "sphinxcontrib-svg2pdfconverter";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "missinglinkelectronics";
    repo = "sphinxcontrib-svg2pdfconverter";
    rev = "v${version}";
    hash = "sha256-E7x4FhkYRySZdifI/bfzd2ZwEyXPsugzJEe30o/mzSs=";
  };

  format = "pyproject";

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ sphinx ];
}
