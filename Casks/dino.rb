# frozen_string_literal: true

cask "dino" do
  version "0.1.0"
  sha256 "e8c3cb7c770e68f04571ec64303579175a298d058732af617948ede5b090ddce"

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
