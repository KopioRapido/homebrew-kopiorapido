# Homebrew formula for KopioRapido CLI
# To use: brew tap KopioRapido/kopiorapido && brew install kopiorapido

class Kopiorapido < Formula
  desc "High-performance cross-platform file copying with delta sync and intelligent transfer"
  homepage "https://kopiorapido.com"
  license "Shareware"
  version "2026.08.22"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-osx-arm64-2026.08.22.tar.gz"
      sha256 "9876c6cee439ef02edea707b2cec3432a7712e4e12cd90d54f8b35017456464f"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-osx-x64-2026.08.22.tar.gz"
      sha256 "b76dc3c343e70adfb4e93d5f4a05254153f306c6e9d3e6ed3642050fa54f93e8"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-linux-arm64-2026.08.22.tar.gz"
      sha256 "cd98e1ce59f7853ece99ea2dcdd6be4a8d285d422ab45a5595fca7183f139cf8"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-linux-x64-2026.08.22.tar.gz"
      sha256 "911a7564af37b4063cf1c7c5aa1f9a3859d2b0833fdf39f38f33111896ae9093"
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
