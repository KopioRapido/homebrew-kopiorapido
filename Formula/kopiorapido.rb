class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.02.15"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-osx-arm64-2026.02.15.tar.gz"
      sha256 "51fcaf081607afa246b7ff643d9c747dbfb4f4e1778879d0bb401fe52078870a"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-osx-x64-2026.02.15.tar.gz"
      sha256 "74e3a12f09664d95b4f2a5fb81d59e2eb2d3c86998c609da1721ff2a4b50c670"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-linux-arm64-2026.02.15.tar.gz"
      sha256 "5d8f3667332f7af7ef2b0c0897f5a5c368f2f2790a3c2ee1e188e84a9436f39e"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-linux-x64-2026.02.15.tar.gz"
      sha256 "35d6c65f08f351755e156fa6ea2f2faa6b4e1c41c36e35cb6726e245ebd209d3"
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
