class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.07.05"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.07.05/cli/kopiorapido-cli-osx-arm64-2026.07.05.tar.gz"
      sha256 "be7199c7a73762668df5ff441bfa5e2661498fe32623096a976e1193ae07fa25"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.07.05/cli/kopiorapido-cli-osx-x64-2026.07.05.tar.gz"
      sha256 "b1886bc592b1f0dc15a201382a52356b7ea85384026988b48c83e0e736878001"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.07.05/cli/kopiorapido-cli-linux-arm64-2026.07.05.tar.gz"
      sha256 "e8530dee69a4ca9181f0495fd5bc90ded5eb8901aee9c20574b83d52624ae66c"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.07.05/cli/kopiorapido-cli-linux-x64-2026.07.05.tar.gz"
      sha256 "ee8fbd13a4c55f8366fd218959a1b73de2ff1f100998ffb969031c54adca1a20"
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
