# Homebrew formula for KopioRapido CLI
# To use: brew tap KopioRapido/kopiorapido && brew install kopiorapido

class Kopiorapido < Formula
  desc "High-performance cross-platform file copying with delta sync and intelligent transfer"
  homepage "https://kopiorapido.com"
  license "Shareware"
  version "2026.08.22.1"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.22.1/cli/kopiorapido-cli-osx-arm64-2026.08.22.1.tar.gz?v=2"
      sha256 "85bb42e7ef96522413e5ce08d602fd04e3b00e31b7639bbbe4070e0af5bd2959"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22.1/cli/kopiorapido-cli-osx-x64-2026.08.22.1.tar.gz?v=2"
      sha256 "e376fae2de5f460d91af1a1af28a1c8ccb245754b56421b05ab4ea1ea90da5a4"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.22.1/cli/kopiorapido-cli-linux-arm64-2026.08.22.1.tar.gz?v=2"
      sha256 "b7017b912c0a9e7bc142489a3418b5c37c239683762d7ee315eed3d52b2436f3"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22.1/cli/kopiorapido-cli-linux-x64-2026.08.22.1.tar.gz?v=2"
      sha256 "7b47342368da2364f0ddde7f449f01b3bb4f859e61ab25ee9ce998a9ff8e81f6"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"kp" => "kp"
    bin.install_symlink libexec/"kp" => "kopiorapido"
  end

  test do
    assert_match "KopioRapido", shell_output("#{bin}/kp --version")
    assert_match "KopioRapido", shell_output("#{bin}/kopiorapido --version")
  end
end
