{
  lib,
  buildPythonPackage,
  fetchFromCodeberg,
  gettext,
  poetry-core,
  sphinxHook,
  furo,
  myst-parser,
  pbr,
  sphinxcontrib-apidoc,

  # dependencies
  attrs,
  click,
  python-debian,
  jinja2,
  license-expression,
  python-magic,
  tomlkit,

  # test dependencies
  freezegun,
  gitMinimal,
  pytest-lazy-fixtures,
  pytestCheckHook,
}:

buildPythonPackage {
  pname = "reuse";
  # Unreleased snapshot of main, needed for features after v6.2.0
  # (e.g. custom_properties in REUSE.toml annotations, f94ae0b1bb).
  version = "6.2.0-unstable-2026-10-13";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "fsfe";
    repo = "reuse-tool";
    rev = "76c399d9f941cdad857c88fcdda4fdc89cbca134";
    hash = "sha256-//2O4aG6Ww0eGjL88j2Zln1ysiJ3qC9E3cnjvDvKv00=";
  };

  outputs = [
    "out"
    "doc"
    "man"
  ];

  nativeBuildInputs = [
    # Used by _build.py to compile the translations
    gettext
  ];

  build-system = [
    poetry-core
    sphinxHook
    furo
    myst-parser
    # Needed at runtime by sphinxcontrib-apidoc
    pbr
    sphinxcontrib-apidoc
  ];

  dependencies = [
    attrs
    click
    python-debian
    jinja2
    license-expression
    python-magic
    tomlkit
  ];

  nativeCheckInputs = [
    freezegun
    gitMinimal
    pytest-lazy-fixtures
    pytestCheckHook
  ];

  disabledTestPaths = [
    # pytest wants to execute the actual source files, which fails with ImportPathMismatchError()
    "src/reuse"
  ];

  sphinxBuilders = [
    "html"
    "man"
  ];
  sphinxRoot = "docs";

  pythonImportsCheck = [ "reuse" ];

  meta = {
    description = "Tool for compliance with the REUSE Initiative recommendations";
    homepage = "https://codeberg.org/fsfe/reuse-tool";
    license = with lib.licenses; [
      asl20
      cc-by-sa-40
      cc0
      gpl3Plus
    ];
    maintainers = with lib.maintainers; [ ];
    mainProgram = "reuse";
  };
}
