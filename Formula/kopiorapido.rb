class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.02.15"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-osx-arm64-2026.02.15.tar.gz"
      sha256 "d06051f5ca1fb995c5afe941a98b40040ae3524bba6686b9f5e0779b10a51e74"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-osx-x64-2026.02.15.tar.gz"
      sha256 "e55f12479d138f87f9065533478f7343cd66eff8e0a0dcfd52929163aeb8317e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-linux-arm64-2026.02.15.tar.gz"
      sha256 "c97f7b7bd0dea2fad88ec51ef78b4a2a8003538abd8bbc98e85e2894d8745c30"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-linux-x64-2026.02.15.tar.gz"
      sha256 "d9f2edfc4d141bcc3057cf3fe22be67aa432eab41618fb625f3158bf7924a456"
    end
  end

  depends_on :macos => :big_sur if OS.mac?

  def install
    # Install all files to libexec to keep them together
    libexec.install Dir["*"]

    # Create wrapper script in bin that runs from libexec
    (bin/"kopiorapido").write_env_script libexec/"kopiorapido", {}
  end

  test do
    system "#{bin}/kopiorapido", "--version"
  end
end
