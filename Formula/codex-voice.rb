class CodexVoice < Formula
  desc "Voice-enabled overlay for Codex CLI"
  homepage "https://github.com/jguida941/codex-voice"
  url "https://github.com/jguida941/codex-voice/archive/refs/tags/v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "57288399c6b965eaddfa9dbb99f843707f28d9af31d88e2359beeb3b5acb512d"

  depends_on "rust" => :build
  depends_on "cmake" => :build

  def install
    libexec.install Dir["*"]
    system "cargo", "build", "--release", "--bin", "codex_overlay", "--manifest-path", "#{libexec}/rust_tui/Cargo.toml"

    bin.install "#{libexec}/rust_tui/target/release/codex_overlay" => "codex-overlay"
    (bin/"codex-voice").write <<~EOS
      #!/bin/bash
      export CODEX_VOICE_CWD="$(pwd)"
      export CODEX_VOICE_MODE=overlay
      exec "#{libexec}/start.sh" "$@"
    EOS
    chmod 0755, bin/"codex-voice"
  end

  def caveats
    <<~EOS
      First run downloads a Whisper model if missing.
      To pre-download manually:
        #{libexec}/scripts/setup.sh models --base
    EOS
  end
end
