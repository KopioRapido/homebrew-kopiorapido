class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.07.04"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.07.04/cli/kopiorapido-cli-osx-arm64-2026.07.04.tar.gz"
      sha256 "2a955d3989f4ab60e6e5c47c6ea7605a66a61d7700d8841792410fad8ab41f4d"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.07.04/cli/kopiorapido-cli-osx-x64-2026.07.04.tar.gz"
      sha256 "cf75abaa43f84fc253cf4e4f6deeb2484cdc904bd99add95e2f733b1bbaebbfd"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.07.04/cli/kopiorapido-cli-linux-arm64-2026.07.04.tar.gz"
      sha256 "dcdd0c02e697d4fd923345c994e7314f083dcf23cc7561e2e22cd8ff1cc50ed3"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.07.04/cli/kopiorapido-cli-linux-x64-2026.07.04.tar.gz"
      sha256 "b91e149613cc08205336ae658900936461c81cc13e3857fefbcff220fea34516"
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
