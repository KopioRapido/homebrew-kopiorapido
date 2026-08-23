# Homebrew formula for KopioRapido CLI
# To use: brew tap KopioRapido/kopiorapido && brew install kopiorapido

class Kopiorapido < Formula
  desc "High-performance cross-platform file copying with delta sync and intelligent transfer"
  homepage "https://kopiorapido.com"
  license "Shareware"
  version "2026.08.23"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.23/cli/kopiorapido-cli-osx-arm64-2026.08.23.tar.gz?v=2"
      sha256 "4d29f1a5d066d6ef932fdbda10c7b1df9bdade99dae687abc6cfd70dc1c2a8f0"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.23/cli/kopiorapido-cli-osx-x64-2026.08.23.tar.gz?v=2"
      sha256 "ec80b37fa1551e479a91fc0b57f33c11498c72cc1ffa6bf8e959a52c6f115d0c"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.23/cli/kopiorapido-cli-linux-arm64-2026.08.23.tar.gz?v=2"
      sha256 "00cc94efe42064fff57694c1bfe5edde0a765b5f9b1a45760e88d1dc1678a5d6"
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.23/cli/kopiorapido-cli-linux-x64-2026.08.23.tar.gz?v=2"
      sha256 "8d2ad1ac15aa6c14692890a639dbbfe471f1b92752e78465925cec4dcff444a2"
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
