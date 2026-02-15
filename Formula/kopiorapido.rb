class Kopiorapido < Formula
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"
  version "2026.02.06"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.06/cli/kopiorapido-cli-osx-arm64-2026.02.06.tar.gz"
      sha256 "f210d6d439ce560595c00093215e75453cd783ce9e2beb3bd266490820dbf152"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.06/cli/kopiorapido-cli-osx-x64-2026.02.06.tar.gz"
      sha256 "d34bec9d43bd0318f8c8749cfd23311af2a145f6ad928a2b2e83d70e9df9e8ab"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.kopiorapido.com/2026.02.06/cli/kopiorapido-cli-linux-arm64-2026.02.06.tar.gz"
      sha256 "4cc693cebd8700ab55791f06298f944d58e80e4195febb4cd254f3b65cec1c70"
    end

    on_intel do
      url "https://releases.kopiorapido.com/2026.02.06/cli/kopiorapido-cli-linux-x64-2026.02.06.tar.gz"
      sha256 "1db2116e231f89da4ddcbe9849bf1daea6d62eea1894ce30adcd83ff36d57b98"
    end
  end

  depends_on :macos => :big_sur if OS.mac?

  def install
    bin.install "KopioRapido.CLI" => "kopiorapido"
  end

  test do
    system "#{bin}/kopiorapido", "--version"
  end
end
