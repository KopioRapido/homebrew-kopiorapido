class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.07.06"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.07.06/cli/kopiorapido-cli-osx-arm64-2026.07.06.tar.gz"
      sha256 "e65a25442a0eab4e038d79e01bb468b668bb50c10f8557280237dc3d9bd13023"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.07.06/cli/kopiorapido-cli-osx-x64-2026.07.06.tar.gz"
      sha256 "fe63a9a3fb8db1c9cab534c270b45c16cfb920316b666b2c6a58cd7cd86b0b28"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.07.06/cli/kopiorapido-cli-linux-arm64-2026.07.06.tar.gz"
      sha256 "900737e2e1a5db50576b1dd83dd11040489a865e8dbf45e7d351d06795c710b6"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.07.06/cli/kopiorapido-cli-linux-x64-2026.07.06.tar.gz"
      sha256 "ea8f0baf5848ca5b6d78693a215b065be9202e076c62bc40dabdcab002f93602"
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
