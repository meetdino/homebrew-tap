# frozen_string_literal: true

cask "dino" do
  version "0.1.1"
  sha256 "751f9a60d213b50b902bb79ae55802db79e95d7267bad6bc352714d9ec433b5f"

  url "https://github.com/asdf9384/dino-releases/releases/download/v#{version}/Dino-#{version}-arm64.dmg",
      verified: "github.com/asdf9384/dino-releases/"
  name "dino"
  desc "Terminal for the agent era, on Ghostty's core"
  homepage "https://meetdino.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Dino.app"
  binary "#{appdir}/Dino.app/Contents/Helpers/dino"

  zap trash: [
    "~/.config/dino",
    "~/Library/Preferences/dev.dino.app.plist",
    "~/Library/Saved Application State/dev.dino.app.savedState",
  ]
end
