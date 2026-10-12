# frozen_string_literal: true

cask "dino" do
  version "0.1.13"
  sha256 "c263ba2ffc936d8f8e5509cecda7e7ad49d1529244b559902e96af5f17b76e17"

  url "https://github.com/meetdino/dino/releases/download/v#{version}/Dino-#{version}-arm64.dmg"
  name "dino"
  desc "Terminal for the agent era, on Ghostty's core"
  homepage "https://meetdino.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Dino.app"
  binary "#{appdir}/Dino.app/Contents/Helpers/dino"

  # dinod's launch agents: the app's (SMAppService: dinod-host since 0.1.6, dinod before it) and
  # the CLI's.
  zap launchctl: ["dev.dino.app.dinod-host", "dev.dino.app.dinod", "dev.dino.app.dinod-cli"],
      trash:     [
    "~/.config/dino",
    "~/Library/LaunchAgents/dev.dino.app.dinod-cli.plist",
    "~/Library/Preferences/dev.dino.app.plist",
    "~/Library/Saved Application State/dev.dino.app.savedState",
  ]
end
