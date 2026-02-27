# AGENTS.md

This repository packages a collection of Python packages that aren't available
in nixpkgs.

## Git Convention
- All commits should follow a style similar to nixpkgs:
  - Prefix the commit description with the name of the package being touched.
  - Version upgrades are described by `x.y.z -> u.v.w`.
  - Don't prefix the versions with `v`.
  - Adding a new package is described by `Init at x.y.z`.
  - Removing a package is described by `Drop`.
  - Other changes to a package get a concise description, e.g. `format`.
- A commit should only touch a single package unless absolutely necessary.
- Don't use fixup commits. Squash additional changes into the existing commit
  instead, to create neat, atomic changes.

## Development Environment

- Use `nix develop` to enter a development environment with useful tools
  installed.
- The development environment also contains the packages themselves, which
  allows for testing imports.

## Checking for updates

- Available updates for packages can be checked using
  `scripts/check_versions.py`.

## Updating Packages
- Try to update packages using `nix-update --flake <package>`.
- If `nix-update` fails, fall back to removing the current derivation and
  starting fresh with `nix-init`

## Testing Updated Packages
After updating a package, verify it works before committing:
- For applications: run the command with `--help` or `--version` to confirm
  it executes correctly.
- For libraries: do a manual import check using `nix develop .#all-packages`.
- Run `nix flake check` to build all packages and run their configured import
  checks. This is important because some packages depend on one another, so
  building a single package in isolation may not be sufficient.
