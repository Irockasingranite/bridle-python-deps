{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  h5py,
  numpy,
  sphinx,
  sphinx-rtd-theme,
  scipy,
  deptry,
  pytest,
  ruff,
}:

buildPythonPackage rec {
  pname = "hdf5storage";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uu++/wqaDcPyczhBBnY8bJiPltlGF3Jv1qDv/nPCnmM=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    h5py
    numpy
  ];

  optional-dependencies = {
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
