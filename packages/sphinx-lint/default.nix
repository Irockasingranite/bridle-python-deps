{
  lib,
  python,
  fetchPypi,
}:

python.pkgs.buildPythonApplication rec {
  pname = "sphinx-lint";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_lint";
    inherit version;
    hash = "sha256-Tn/BL0T3ULAAbqrSN9fbmx2KupKt2pyDiviRZUs3HTU=";
  };

  build-system = [
    python.pkgs.hatch-vcs
    python.pkgs.hatchling
  ];

  dependencies = with python.pkgs; [
    polib
    regex
  ];

  optional-dependencies = with python.pkgs; {
    tests = [
      pytest
      pytest-cov
    ];
  };

  meta = {
    description = "Check for stylistic and formal issues in .rst and .py files included in the documentation";
    homepage = "https://pypi.org/project/sphinx-lint/";
    license = lib.licenses.psfl;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "sphinx-lint";
  };
}
