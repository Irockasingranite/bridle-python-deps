{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  h5py,
  numpy,
  deptry,
  mypy,
  pytest,
  pytest-cov,
  ruff,
  scipy,
  scipy-stubs,
  sphinx,
  sphinx-rtd-theme,
}:

buildPythonPackage rec {
  pname = "hdf5storage";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bP0DGuug/fufsdsqp1sJqNa4RcmHRbSiwMjY11LVj+c=";
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
      mypy
      pytest
      pytest-cov
      ruff
      scipy
      scipy-stubs
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
      pytest-cov
      ruff
    ];
    typechecking = [
      mypy
      scipy-stubs
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
