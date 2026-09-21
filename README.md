# homebrew-tap

Personal Homebrew tap for macOS applications by Gajeroll.

## Available Casks

- [`capsawake`](https://github.com/gajeroll/capsawake)
- [`command-input`](https://github.com/gajeroll/command-input)

## Installation

Homebrew 7.0 requires trusting third-party taps or casks before installation.

### Option 1: Trust per cask (recommended)

```sh
brew trust --cask gajeroll/tap/capsawake
brew install --cask gajeroll/tap/capsawake
```

```sh
brew trust --cask gajeroll/tap/command-input
brew install --cask gajeroll/tap/command-input
```

### Option 2: Trust entire tap

Trust all present and future casks from this tap:

```sh
brew trust --tap gajeroll/tap
brew install --cask gajeroll/tap/capsawake
brew install --cask gajeroll/tap/command-input
```

## Security

Commits to this tap are a supply-chain boundary: `brew update` pulls changes automatically, and cask Ruby definitions execute locally on your machine.

For maintainer workflows and update procedures, see [CONTRIBUTING.md](CONTRIBUTING.md).
