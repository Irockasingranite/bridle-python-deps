{
  lib,
  buildPythonPackage,
  fetchPypi,
  cargo,
  pkg-config,
  rustPlatform,
  rustc,
  setuptools,
  setuptools-rust,
  wheel,
  libusb,
}:

buildPythonPackage rec {
  pname = "cantact";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qhdxS7pMmXr8E3OEQP9xpsY5Z7Jeh2eCNf9PhxLtXlQ=";
  };

  cargoDeps = rustPlatform.importCargoLock { lockFile = ./Cargo.lock; };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [
    cargo
    pkg-config
    rustPlatform.cargoSetupHook
    rustc
    setuptools
    setuptools-rust
    wheel
  ];

  buildInputs = [ libusb ];

  pythonImportsCheck = [ "cantact" ];

  meta = with lib; {
    description = "Support for the CANtact Controller Area Network Devices";
    homepage = "https://pypi.org/project/cantact/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
