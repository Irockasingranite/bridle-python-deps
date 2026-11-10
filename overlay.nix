final: prev:
let
  python = prev.python3Packages;
  nrf-regtool = python.callPackage ./packages/nrf-regtool { inherit svada; };
  pydebuggerconfig = python.callPackage ./packages/pydebuggerconfig { };
  pykitinfo = python.callPackage ./packages/pykitinfo { inherit pydebuggerconfig; };
  sphinx-tsn-theme = python.callPackage ./packages/sphinx-tsn-theme { };
  sphinx-csv-filter = python.callPackage ./packages/sphinx-csv-filter { };
  sphinx-filter-tabs = python.callPackage ./packages/sphinx-filter-tabs { };
  sphobjinv = python.callPackage ./packages/sphobjinv { };
  svada = python.callPackage ./packages/svada { };
in
{
  # Top-level packages
  inherit
    nrf-regtool
    svada
    ;

  # Python packages
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      inherit
        pydebuggerconfig
        pykitinfo
        sphinx-csv-filter
        sphinx-filter-tabs
        sphinx-tsn-theme
        sphobjinv
        ;
    })
  ];
}
