{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, sphinx-rtd-theme
}:

buildPythonPackage rec {

  pname = "sphinx-tsn-theme";
  version = "2024.1.0";

  src = fetchPypi {
    pname = "sphinx_tsn_theme";
    inherit version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    hash = "sha256-2BECC7XvezBzUk/Zs3CDfEfgX7K4YqcCYvsUQBLw0qs=";
  };

  format = "wheel";

  propagatedBuildInputs = [
    sphinx-rtd-theme
  ];
}
