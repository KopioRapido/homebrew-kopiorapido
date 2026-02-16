class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.02.15"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-osx-arm64-2026.02.15.tar.gz"
      sha256 "9f3e1c8812dbcdcab2edb7915c9d3f8ef01032513cc5d1a22073a938dfa8c04a"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-osx-x64-2026.02.15.tar.gz"
      sha256 "06b8cc0bb6bc97fe8b3115784ba5f4ae5cacd337d85248a91ccf8cb73c81f01e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-linux-arm64-2026.02.15.tar.gz"
      sha256 "6c02d7eb8d33e1eac867cf60a81892a392552c24bd6587ec258888338acf05aa"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.15/cli/kopiorapido-cli-linux-x64-2026.02.15.tar.gz"
      sha256 "24b7aca968c6a592f2e5c0f20d9ab579864cdecfe53419938bea1f7dd63c2cc7"
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
