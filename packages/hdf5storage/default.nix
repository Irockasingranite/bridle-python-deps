{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  h5py,
  numpy,
  deptry,
  pytest,
  ruff,
  scipy,
  sphinx,
  sphinx-rtd-theme,
}:

buildPythonPackage rec {
  pname = "hdf5storage";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qLZX5uPAe9NdRIFNLh3GSeLeGZ537Mpe/u1TmenugyY=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    h5py
    numpy
  ];

  optional-dependencies = {
    dev = [
      deptry
      pytest
      ruff
      scipy
      sphinx
      sphinx-rtd-theme
    ];
    docs = [
      sphinx
      sphinx-rtd-theme
    ];
    scipy = [
      scipy
    ];
    tests = [
      deptry
      pytest
      ruff
    ];
  };

  pythonImportsCheck = [
    "hdf5storage"
  ];

  meta = {
    description = "Utilities to read/write Python types to/from HDF5 files, including MATLAB v7.3 MAT files";
    homepage = "https://pypi.org/project/hdf5storage/";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ ];
  };
}
