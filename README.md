# homebrew-voiceterm

Homebrew tap for [VoiceTerm](https://github.com/jguida941/voiceterm) - Voice HUD for AI CLIs with local Whisper STT.

## Install

```bash
brew tap jguida941/voiceterm
brew install voiceterm
```

Upgrade:

```bash
brew update
brew upgrade voiceterm
```

## Usage

```bash
cd ~/my-project
voiceterm
```

First run downloads a Whisper model if missing. Homebrew installs store models at:
`~/.local/share/voiceterm/models` (override with `VOICETERM_MODEL_DIR`).

## Options

```bash
voiceterm --help                    # Show all options
voiceterm --theme dracula           # Use a different theme
voiceterm --auto-voice              # Start with auto-voice enabled
voiceterm --claude                  # Use Claude Code instead of Codex
voiceterm --mic-meter               # Measure ambient/speech levels
voiceterm --hud-style hidden        # Minimal UI (blank when idle)
```

### Available Themes
`chatgpt`, `claude`, `codex`, `coral` (default), `catppuccin`, `dracula`, `nord`, `tokyonight`, `gruvbox`, `ansi`, `none`

### Available Backends
`codex` (default), `claude`

## Pre-download Whisper Model (optional)

```bash
$(brew --prefix)/opt/voiceterm/libexec/scripts/setup.sh models --base
```

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+R` | Record (push-to-talk) |
| `Ctrl+V` | Toggle auto-voice |
| `Ctrl+T` | Toggle send mode |
| `Ctrl+Y` | Theme picker |
| `Ctrl+O` | Settings menu |
| `Ctrl+]` | Mic sensitivity up |
| `Ctrl+\` | Mic sensitivity down |
| `?` | Show help overlay |
| `Ctrl+Q` | Quit |

## Requirements

- macOS (Apple Silicon or Intel) or Linux with Homebrew
- Builds from source (Rust + CMake installed automatically by Homebrew)

## Troubleshooting

```bash
# Rebuild from source
brew reinstall voiceterm

# Check Whisper model
ls ~/.local/share/voiceterm/models/
```

More help: https://github.com/jguida941/voiceterm/blob/master/guides/TROUBLESHOOTING.md

## Version

Current: v1.0.64
