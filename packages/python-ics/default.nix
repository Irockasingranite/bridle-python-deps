{
  lib,
  buildPythonPackage,
  fetchPypi,
  dunamai,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "python-ics";
  version = "915.14";
  pyproject = true;

  src = fetchPypi {
    pname = "python_ics";
    inherit version;
    hash = "sha256-5Y+lIVq+bWzIAST8Fj3v+rej/0aXS82TTu7UT1t4QKw=";
  };

  nativeBuildInputs = [
    dunamai
    setuptools
    wheel
  ];

  pythonImportsCheck = [ "python_ics" ];

  meta = with lib; {
    description = "Python wrapper for interfacing to IntrepidCS Hardware";
    homepage = "https://pypi.org/project/python-ics/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
