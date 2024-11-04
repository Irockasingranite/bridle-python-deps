{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  msgpack,
  packaging,
  typing-extensions,
  wrapt,
  canalystii,
  # , python-can-canine # See below
  cantact,
  python-can-cvector,
  gs-usb,
  black,
  mypy,
  pylint,
  ruff,
  asammdf,
  filelock,
  python-ics,
  nixnet,
  uptime,
  python-can-remote,
  pyserial,
  python-can-sontheim,
}:

buildPythonPackage rec {
  pname = "python-can";
  version = "4.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_can";
    inherit version;
    hash = "sha256-abW8g2TY8Zyd/DUQdhBjT+n/jdqE7i5UuBRYrIyhFzc=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    msgpack
    packaging
    typing-extensions
    wrapt
  ];

  passthru.optional-dependencies = {
    canalystii = [ canalystii ];
    # This plugin doesn't provide a license, so we can't pull it in
    # canine = [
    # python-can-canine
    # ];
    cantact = [ cantact ];
    cvector = [ python-can-cvector ];
    gs_usb = [ gs-usb ];
    lint = [
      black
      mypy
      pylint
      ruff
    ];
    mf4 = [ asammdf ];
    neovi = [
      filelock
      python-ics
    ];
    nixnet = [ nixnet ];
    pcan = [ uptime ];
    remote = [ python-can-remote ];
    seeedstudio = [ pyserial ];
    serial = [ pyserial ];
    sontheim = [ python-can-sontheim ];
  };

  pythonRelaxDeps = [ "msgpack" ];

  pythonImportsCheck = [ "can" ];

  meta = with lib; {
    description = "Controller Area Network interface module for Python";
    homepage = "https://pypi.org/project/python-can/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
  };
}
