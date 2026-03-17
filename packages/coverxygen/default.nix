{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "coverxygen";
  version = "1.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hcwUCM6a+QaZCs/BFoSJ9rJYEdQ55LjSeh30SYIwxaw=";
  };

  build-system = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [
    "coverxygen"
  ];

  meta = {
    description = "Generate doxygen's documentation coverage report";
    homepage = "https://pypi.org/project/coverxygen";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
