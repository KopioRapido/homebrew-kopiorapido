class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.08.01"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-arm64-2026.08.01.tar.gz"
      sha256 "3320bb7d68235d12724cfbca51e5e938e9284c99d585c1e1e16b39097955ed09"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-x64-2026.08.01.tar.gz"
      sha256 "2b7fc44a5f5a8d2ee300bc85e184152d642c88678dec640ac0d8dacd794bb1d6"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-arm64-2026.08.01.tar.gz"
      sha256 "c9d930aa0257c8065a60aaa5f3d304e59142e29fe2124f2ec4cddde49914e900"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-x64-2026.08.01.tar.gz"
      sha256 "52350d105337fb18d21d4e9bb1a090bf13def2e95fc9aa6f7e977114224e19ae"
    end
  end

  depends_on :macos => :big_sur if OS.mac?

  def install
    # Install all files to libexec to keep them together
    libexec.install Dir["*"]

    # Create wrapper script in bin that runs from libexec
    (bin/"kopiorapido").write_env_script libexec/"kopiorapido", {}

    # Create kp alias symlink
    bin.install_symlink libexec/"kopiorapido" => "kp"
  end

  test do
    system "#{bin}/kopiorapido", "--version"
    system "#{bin}/kp", "--version"
  end
end
