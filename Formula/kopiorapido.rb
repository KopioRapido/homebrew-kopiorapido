# Homebrew formula for KopioRapido CLI
# To use: brew tap KopioRapido/kopiorapido && brew install kopiorapido
#
# Download URLs: https://releases.kopiorapido.com/
# Note: SHA256 values are updated by release.yml workflow auto-update.
#       To update manually: download artifacts, run `shasum -a 256 <file>`, replace placeholders.

class Kopiorapido < Formula
  desc "High-performance cross-platform file copying with delta sync and intelligent transfer"
  homepage "https://kopiorapido.com"
  license "Shareware"
  version "2026.08.01"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-arm64-2026.08.01.tar.gz"
      sha256 "b4e3c0f7a5d8e9f2c1b6a3d7e9f1c2b5a8d6e4f3c7b9a1d5e8f2c4b6a9d3e7f1"  # update on release
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-x64-2026.08.01.tar.gz"
      sha256 "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2"  # update on release
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-arm64-2026.08.01.tar.gz"
      sha256 "f8235082df3e9631307de2a7dc4967f9d5833a5d930187f8343e10a254c3fa9a"  # update on release
    end
    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-x64-2026.08.01.tar.gz"
      sha256 "70fdf1ea25758ffd1ae4337df380051bd893ed76bb66bd009927b3609f56653e"  # update on release
    end
  end

  def install
     # Extract kp binary from archive
     cache.download
     tarball = Dir.glob("*.tar.gz").first
     system "tar", "xzf", tarball
     bin.install "kp"
     # Create kopiorapido symlink so both 'kp' and 'kopiorapido' work
     bin.install_symlink "kp" => "kopiorapido"
   end

  def caveats
    <<~EOS
      KopioRapido CLI has been installed!

      Quick start:
        kp copy /source /destination
        kp --help

      For shell completion:
        kp completion bash >> ~/.bashrc
        kp completion zsh > ~/.zsh/completion/_kp

      Documentation: https://kopiorapido.com
    EOS
  end

  test do
     assert_match "KopioRapido", shell_output("#{bin}/kp --version")
   end
end
