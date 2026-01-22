# homebrew-codex-voice

Homebrew tap for Codex Voice (Rust overlay mode).

## Install

```bash
brew tap jguida941/homebrew-codex-voice
brew install codex-voice
```

## One-time model download

```bash
$(brew --prefix)/opt/codex-voice/libexec/scripts/setup.sh models --base
```

## Run from any project

```bash
cd ~/my-project
codex-voice
```

## Notes

- This formula builds from source (Rust + CMake required).
- The formula currently tracks the `master` branch. Update the `url` and `sha256`
  to a tagged release when available.
