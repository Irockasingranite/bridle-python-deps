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
  version = "7.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jHIMvl1HzEJCccn8OzIDdgcd7SWk4oH8IuEsvqrN3eI=";
  };

  nativeBuildInputs = [
    numpy
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
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

  passthru.optional-dependencies = {
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
    export_matlab_v5 = [ scipy ];
    filesystem = [ fsspec ];
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
    symbolic_math = [ sympy ];
  };

  pythonImportsCheck = [ "asammdf" ];

  meta = with lib; {
    description = "ASAM MDF measurement data file parser";
    homepage = "https://pypi.org/project/asammdf/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ ];
  };
}
