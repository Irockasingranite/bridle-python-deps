final: prev:
let
  python = prev.python3Packages;
  deptry = python.callPackage ./packages/deptry { };
  docutils = python.callPackage ./packages/docutils20 { };
  hdf5storage = python.callPackage ./packages/hdf5storage { inherit deptry; };
  nrf-regtool = python.callPackage ./packages/nrf-regtool { inherit svada; };
  pydebuggerconfig = python.callPackage ./packages/pydebuggerconfig { inherit pyedbglib; };
  pyedbglib = python.callPackage ./packages/pyedbglib { };
  pykitinfo = python.callPackage ./packages/pykitinfo { inherit pydebuggerconfig pyedbglib; };
  pymcuprog = python.callPackage ./packages/pymcuprog { inherit pyedbglib; };
  sphinx = python.callPackage ./packages/sphinx8 { };
  sphinx-tsn-theme = python.callPackage ./packages/sphinx-tsn-theme { };
  sphinxcontrib-svg2pdfconverter = python.callPackage ./packages/sphinxcontrib-svg2pdfconverter { };
  sphinx-csv-filter = python.callPackage ./packages/sphinx-csv-filter { };
  sphinx-lint = python.callPackage ./packages/sphinx-lint { };
  sphobjinv = python.callPackage ./packages/sphobjinv { };
  svada = python.callPackage ./packages/svada { };
in
{
  # Top-level packages
  inherit
    deptry
    nrf-regtool
    sphinx-lint
    svada
    ;

  # Python packages
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      inherit
        docutils
        hdf5storage
        pydebuggerconfig
        pyedbglib
        pykitinfo
        pymcuprog
        sphinx
        sphinx-csv-filter
        sphinx-tsn-theme
        sphinxcontrib-svg2pdfconverter
        sphobjinv
        ;
    })
  ];
}
