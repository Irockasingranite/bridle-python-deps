{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  h5py,
  numpy,
}:

buildPythonPackage rec {
  pname = "hdf5storage";
  version = "0.1.19";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ehprrfVG6JQvTSLVmK7hQCF5a8KJGFGcloemq7Du74Y=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    h5py
    numpy
  ];

  pythonImportsCheck = [ "hdf5storage" ];

  meta = with lib; {
    description = "Utilities to read/write Python types to/from HDF5 files, including MATLAB v7.3 MAT files";
    homepage = "https://pypi.org/project/hdf5storage/";
    license = licenses.bsd2;
    maintainers = with maintainers; [ ];
  };
}
