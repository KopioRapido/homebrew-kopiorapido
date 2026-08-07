class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.08.01"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-arm64-2026.08.01.tar.gz"
      sha256 "cc387eff6e3a00e68ec6316999ab39ef0e97ad1f1f47024fc9346838695f5fe3"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-x64-2026.08.01.tar.gz"
      sha256 "c94857b26b21bc84ca83427559cdae139ffc84abb3eaa6a7315473b3fdbc56de"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-arm64-2026.08.01.tar.gz"
      sha256 "f8235082df3e9631307de2a7dc4967f9d5833a5d930187f8343e10a254c3fa9a"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-x64-2026.08.01.tar.gz"
      sha256 "70fdf1ea25758ffd1ae4337df380051bd893ed76bb66bd009927b3609f56653e"
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
