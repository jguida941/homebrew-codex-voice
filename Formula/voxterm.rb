class Voxterm < Formula
  desc "Voice HUD for AI CLIs with local Whisper STT"
  homepage "https://github.com/jguida941/voxterm"
  url "https://github.com/jguida941/voxterm/archive/refs/tags/v1.0.43.tar.gz"
  version "1.0.43"
  sha256 "d842a2dfc8600591def9398e29ea2cbd69ca116da8baeedd21b0888314a9e384"

  depends_on "rust" => :build
  depends_on "cmake" => :build

  def install
    libexec.install Dir["*"]
    system "cargo", "build", "--release", "--bin", "voxterm", "--manifest-path", "#{libexec}/src/Cargo.toml"
    (bin/"voxterm").write <<~EOS
      #!/bin/bash
      export VOXTERM_CWD="$(pwd)"
      export VOXTERM_WRAPPER=1
      exec "#{libexec}/scripts/start.sh" "$@"
    EOS
    chmod 0755, bin/"voxterm"
  end

  def caveats
    <<~EOS
      First run downloads a Whisper model if missing.
      To pre-download manually:
        #{libexec}/scripts/setup.sh models --base

      Themes: chatgpt, claude, codex, coral, catppuccin, dracula, nord, tokyonight, gruvbox, ansi, none
      Backends: codex (default), claude, gemini (in works), or custom command

      Run `voxterm --help` for all options.
    EOS
  end
end
