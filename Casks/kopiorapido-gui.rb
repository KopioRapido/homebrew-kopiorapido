cask "kopiorapido-gui" do
  version "2026.02.15"
  sha256 "4c2f9ddce992d273f891b08888d5212fde9a7db68d213746585595ee842752aa"

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
