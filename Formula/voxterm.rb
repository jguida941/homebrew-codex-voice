class Voxterm < Formula
  desc "Voice HUD for AI CLIs with local Whisper STT"
  homepage "https://github.com/jguida941/voxterm"
  url "https://github.com/jguida941/voxterm/archive/refs/tags/v1.0.42.tar.gz"
  version "1.0.42"
  sha256 "8af6d1376952a55baebab3d625f6e420cea1260e18783a655530060902ab5ce4"

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
