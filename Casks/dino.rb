# frozen_string_literal: true

cask "dino" do
  version "0.1.5"
  sha256 "64ffb3c88e042112a62098c4b69f3f82abc621a89c52ce608fdd7587369ef9a0"

  url "https://github.com/meetdino/dino/releases/download/v#{version}/Dino-#{version}-arm64.dmg"
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

  # dinod's launch agents: the app's (SMAppService; it goes with the app) and the CLI's.
  zap launchctl: ["dev.dino.app.dinod", "dev.dino.app.dinod-cli"],
      trash:     [
    "~/.config/dino",
    "~/Library/LaunchAgents/dev.dino.app.dinod-cli.plist",
    "~/Library/Preferences/dev.dino.app.plist",
    "~/Library/Saved Application State/dev.dino.app.savedState",
  ]
end
