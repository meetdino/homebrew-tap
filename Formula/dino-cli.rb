# frozen_string_literal: true

# dino's command-line client and dinod, without the terminal app.
class DinoCli < Formula
  desc "Command-line client and daemon for the dino terminal"
  homepage "https://meetdino.com/"
  url "https://github.com/asdf9384/dino-releases/releases/download/v0.1.2/dino-0.1.2-darwin-arm64.tar.gz"
  version "0.1.2"
  sha256 "ab8d4309bc9671d535aca01a5d89e9f5bcaf29035f439c6d69558978225cca0b"
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
