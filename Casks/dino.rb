# frozen_string_literal: true

cask "dino" do
  version "0.1.4"
  sha256 "655951844349728f3f9aca610d3b13f1b3a035f8750e3f61f5ecfcd3a64bb557"

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
