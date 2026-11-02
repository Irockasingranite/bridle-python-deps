{ pkgs }:
pkgs.mkShell {

  packages = with pkgs; [
    nrf-regtool
    reuse
    svada
    (python3.withPackages (
      ps: with ps; [
        pydebuggerconfig
        pykitinfo
        reuse
        sphinx-tsn-theme
        sphinxcontrib-svg2pdfconverter
        sphinx-csv-filter
        sphinx-filter-tabs
        sphobjinv
      ]
    ))
  ];
}
