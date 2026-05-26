# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Homebrew tap (`anvera/macos-cleaning-tools`) that distributes macOS cleaning and maintenance scripts. Users install via:

```bash
brew tap anvera/macos-cleaning-tools
brew install macos-cleaning-tools
```

## Repository Structure

```
bin/          # Shell scripts installed into Homebrew's bin/
Formula/
  macos-cleaning-tools.rb   # Single formula that installs all scripts in bin/
```

Adding a new script is as simple as dropping an executable into `bin/` — the formula's `bin.install Dir["bin/*"]` picks it up automatically on the next release.

## Scripts

- **`unused-apps [DAYS]`** — Lists apps in `/Applications` and `~/Applications` not opened in at least `DAYS` days (default 30), sorted by longest unused first. Uses `mdls kMDItemLastUsedDate` for last-launch data.

## Development Commands

```bash
# Run a script directly
./bin/unused-apps [DAYS]
./bin/unused-apps --help

# Audit and lint the formula (requires Homebrew)
brew audit --strict Formula/macos-cleaning-tools.rb
brew style Formula/macos-cleaning-tools.rb

# Test the formula (after filling in sha256 and creating a release)
brew install --build-from-source Formula/macos-cleaning-tools.rb
brew test Formula/macos-cleaning-tools.rb
```

## Releasing a New Version

1. Tag the commit: `git tag v0.x.0 && git push origin v0.x.0`
2. Compute the sha256 of the release tarball:
   ```bash
   curl -L https://github.com/anvera/homebrew-macos-cleaning-tools/archive/refs/tags/v0.x.0.tar.gz | shasum -a 256
   ```
3. Update `url` and `sha256` in `Formula/macos-cleaning-tools.rb`
4. Commit and push the formula update
