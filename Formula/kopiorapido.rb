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
      sha256 "406564999eecd3c43a394c9bd426f05974f6c4cd073f02d6df8a125c31e19f04"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-osx-x64-2026.08.22.tar.gz"
      sha256 "8fe662cf1322de4b7e97bb322c6169f1c4b1fda77e396c3031b397cd1ca76cad"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-linux-arm64-2026.08.22.tar.gz"
      sha256 "6c488dddd5d840b840f0f2d3d9bc47aab9469d021bad14cf4067b822fc25aee9"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-linux-x64-2026.08.22.tar.gz"
      sha256 "482faf8d186f9ef37a3037f54a97400f172eb10044e646472b3bf149657870cc"
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
