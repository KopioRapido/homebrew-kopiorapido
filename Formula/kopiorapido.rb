class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.08.01"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-arm64-2026.08.01.tar.gz"
      sha256 "8783fbdfdfe6e1d0b4338adfaebd4646561c9ccf1b13e14978da9a0e4706e27b"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-x64-2026.08.01.tar.gz"
      sha256 "b0a4cd6f0a601067c3ba93ed70e1409404d2d4c332f74c43bf072fe1361624db"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-arm64-2026.08.01.tar.gz"
      sha256 "37716d7f4b97562e6267d2e1f9336e34590927b4b1f99f2ab7ff4a114122f365"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-x64-2026.08.01.tar.gz"
      sha256 "432526b139feced0f264f7043c5cc68f430b9e85c1713e845321b952ec250e7d"
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
