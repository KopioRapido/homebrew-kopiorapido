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
      sha256 "72c88d977cd37219ca395c89711de0ad274a8ebeb91c325a449a207b7d3c4e31"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-osx-x64-2026.08.22.tar.gz"
      sha256 "4522870c26970045c715c387b792081338e376a7ba3d8fe2a2c5ed6d4a16af6e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-linux-arm64-2026.08.22.tar.gz"
      sha256 "12bb00e53f88d4ea1d2d65219764d707f793554ebb83c8c444ac30fc89cb753d"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.22/cli/kopiorapido-cli-linux-x64-2026.08.22.tar.gz"
      sha256 "9712d7afb15c2272c78d476efbfb3014046d955c2d7d72f2a6c68e36ff11c02a"
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
