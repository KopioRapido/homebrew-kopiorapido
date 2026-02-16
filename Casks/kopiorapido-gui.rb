cask "kopiorapido-gui" do
  version "2026.02.15"
  sha256 "44ede568ae4712b79575a84ac925a3cde0127e94c82221e99d190c5f3b8a1acf"

  url "https://releases.kopiorapido.com/#{version}/gui/kopiorapido-gui-macos-#{version}.dmg"
  name "KopioRapido"
  desc "Intelligent file copying with delta sync, compression, and hardware acceleration"
  homepage "https://kopiorapido.com"

  livecheck do
    url "https://api.github.com/repos/KopioRapido/Source/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end

  auto_updates false

  app "KopioRapido.app"

  zap trash: [
    "~/Library/Preferences/com.kopiorapido.preferences.plist",
    "~/Library/Application Support/KopioRapido",
  ]
end
