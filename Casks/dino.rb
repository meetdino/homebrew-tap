# frozen_string_literal: true

cask "dino" do
  version "0.1.2"
  sha256 "2ac6ce3e8abc5030f77f11a5020d009b61ab13a90f1cc0fa8c5958b728d61a79"

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
