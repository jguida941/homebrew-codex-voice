class CodexVoice < Formula
  desc "Voice-enabled overlay for Codex CLI"
  homepage "https://github.com/jguida941/codex-voice"
  url "https://github.com/jguida941/codex-voice/archive/refs/tags/v1.0.14.tar.gz"
  version "1.0.14"
  sha256 "68a73c13567f4168461ecb17ccd02f7fac51519d54dfa130cb181dd92e477e35"

  depends_on "rust" => :build
  depends_on "cmake" => :build

  def install
    libexec.install Dir["*"]
    system "cargo", "build", "--release", "--bin", "codex_overlay", "--manifest-path", "#{libexec}/rust_tui/Cargo.toml"

    bin.install "#{libexec}/rust_tui/target/release/codex_overlay" => "codex-overlay"
    (bin/"codex-voice").write <<~EOS
      #!/bin/bash
      export CODEX_VOICE_CWD="$(pwd)"
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
