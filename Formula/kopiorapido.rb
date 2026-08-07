class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.08.01"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-arm64-2026.08.01.tar.gz"
      sha256 "e959f3add1dc127e1cde66197d12e6299b0fd2aa54fa7902008dbb865a604eb1"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-osx-x64-2026.08.01.tar.gz"
      sha256 "ea11065316d4f3548471cc3d6bf3aac9140ccb484bf407fdd619c6966866f0c0"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-arm64-2026.08.01.tar.gz"
      sha256 "1c80425e65292327e23d3456745201bc3311795fc1b0024848eafaf0421f6062"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.08.01/cli/kopiorapido-cli-linux-x64-2026.08.01.tar.gz"
      sha256 "0f837a3aea20c030cb451fdf993cb8b73dc7d6d8ce41128b0f0b9501453943b0"
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
