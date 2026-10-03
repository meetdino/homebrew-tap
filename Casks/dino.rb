# frozen_string_literal: true

cask "dino" do
  version "0.0.1"
  sha256 "154e35036738aaf3013e855f9da0f192888dd02965988c3a3cce782a072f0445"

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
