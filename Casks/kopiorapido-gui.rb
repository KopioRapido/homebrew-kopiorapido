cask "kopiorapido-gui" do
  version "2026.02.06"
  sha256 "66c7fab443c9a3abf5aa056221d3c124cdcebfad7fb9a9fa29a59ab36b26fb87"

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
