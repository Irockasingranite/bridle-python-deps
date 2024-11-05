{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  setuptools,
  wheel,
  canmatrix,
  isal,
  lxml,
  lz4,
  numexpr,
  pandas,
  python-dateutil,
  typing-extensions,
  chardet,
  faust-cchardet,
  cryptography,
  keyring,
  fastparquet,
  h5py,
  hdf5storage,
  python-snappy,
  scipy,
  fsspec,
  natsort,
  packaging,
  psutil,
  pyqtgraph,
  pyqtlet2,
  pyside6,
  qtpy,
  sympy,
}:

buildPythonPackage rec {
  pname = "asammdf";
  version = "8.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qkC7QQOu++p1d3/0iIyO4gCJ5i8MFB9+B8Ad4b65Mkc=";
  };

  build-system = [
    numpy
    setuptools
    wheel
  ];

  dependencies = [
    canmatrix
    isal
    lxml
    lz4
    numexpr
    numpy
    pandas
    python-dateutil
    typing-extensions
  ];

  optional-dependencies = {
    decode = [
      chardet
      faust-cchardet
    ];
    encryption = [
      cryptography
      keyring
    ];
    export = [
      fastparquet
      h5py
      hdf5storage
      python-snappy
    ];
    export-matlab-v5 = [
      scipy
    ];
    filesystem = [
      fsspec
    ];
    gui = [
      lxml
      natsort
      packaging
      psutil
      pyqtgraph
      pyqtlet2
      pyside6
      qtpy
    ];
    symbolic-math = [
      sympy
    ];
  };

  pythonRelaxDeps = [
    "canmatrix"
  ];

  pythonImportsCheck = [
    "asammdf"
  ];

  meta = {
    description = "ASAM MDF measurement data file parser";
    homepage = "https://pypi.org/project/asammdf/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ];
  };
}
