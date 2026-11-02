final: prev:
let
  python = prev.python3Packages;
  coverxygen = python.callPackage ./packages/coverxygen { };
  nrf-regtool = python.callPackage ./packages/nrf-regtool { inherit svada; };
  pydebuggerconfig = python.callPackage ./packages/pydebuggerconfig { inherit pyedbglib; };
  pyedbglib = python.callPackage ./packages/pyedbglib { };
  pykitinfo = python.callPackage ./packages/pykitinfo { inherit pydebuggerconfig pyedbglib; };
  pymcuprog = python.callPackage ./packages/pymcuprog { inherit pyedbglib; };
  reuse = python.callPackage ./packages/reuse { };
  sphinx-tsn-theme = python.callPackage ./packages/sphinx-tsn-theme { };
  sphinxcontrib-svg2pdfconverter = python.callPackage ./packages/sphinxcontrib-svg2pdfconverter { };
  sphinx-csv-filter = python.callPackage ./packages/sphinx-csv-filter { };
  sphinx-filter-tabs = python.callPackage ./packages/sphinx-filter-tabs { };
  sphinx-lint = python.callPackage ./packages/sphinx-lint { };
  sphobjinv = python.callPackage ./packages/sphobjinv { };
  svada = python.callPackage ./packages/svada { };
in
{
  # Top-level packages
  inherit
    nrf-regtool
    sphinx-lint
    svada
    ;

  # Python packages
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      inherit
        coverxygen
        pydebuggerconfig
        pyedbglib
        pykitinfo
        pymcuprog
        reuse
        sphinx-csv-filter
        sphinx-filter-tabs
        sphinx-tsn-theme
        sphinxcontrib-svg2pdfconverter
        sphobjinv
        ;
    })
  ];
}
