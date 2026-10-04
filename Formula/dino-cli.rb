# frozen_string_literal: true

# dino's command-line client and dinod, without the terminal app.
class DinoCli < Formula
  desc "Command-line client and daemon for the dino terminal"
  homepage "https://meetdino.com/"
  url "https://github.com/asdf9384/dino-releases/releases/download/v0.1.4/dino-0.1.4-darwin-arm64.tar.gz"
  version "0.1.4"
  sha256 "85e37c3d4b900f20181f8c1c910486b40319d0816571738b1d902b7745d23ad6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  conflicts_with cask: "dino", because: "the dino app includes the dino command"

  def install
    bin.install "dino"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dino --version")
  end
end
