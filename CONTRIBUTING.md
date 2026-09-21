# Contributing to homebrew-tap

This repository is a personal Homebrew tap for Gajeroll applications.

## Security Boundary & Pull Requests

Casks execute Ruby code on end-user machines during installation and upgrade. Because `brew update` fetches changes automatically without prompt, this tap is treated as a security boundary:

- Unsolicited third-party cask or formula pull requests are not accepted.
- Branch protection is active on `main`: direct pushes and force-pushes are disabled. All changes must go through reviewed pull requests.

## Repository Layout

Cask definitions reside in the `Casks/` directory using a flat layout (not sharded):

```text
Casks/
├── capsawake.rb
└── command-input.rb
```

## Maintenance Workflow

### 1. Asset Immutability
Never overwrite or replace published GitHub Release assets that existing cask versions reference. Always publish a new release version instead.

### 2. Checksum Calculation
Always compute SHA256 checksums from the published release asset downloaded via GitHub CLI, never from a local build:

```sh
gh release download <TAG> --repo gajeroll/<REPO> --pattern "<FILENAME>" --dir /tmp
shasum -a 256 /tmp/<FILENAME>
```

Update the `version` and `sha256` fields in `Casks/<cask>.rb`.

## Testing and Verification

### CI Checks
CI runs the following commands on pull requests:

```sh
brew style
brew audit --cask --online
```

Do not run `brew audit --new` (notability and repository-age checks do not apply to this tap).

### Code Signing Verification
`brew audit --cask --signing` is disabled in Homebrew 7 with no replacement. Code signing and notarization are verified at release time inside the application repository via `spctl --assess` and `make notarize`.
