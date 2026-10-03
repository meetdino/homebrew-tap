# frozen_string_literal: true

# dino's command-line client and dinod, without the terminal app.
class DinoCli < Formula
  desc "Command-line client and daemon for the dino terminal"
  homepage "https://meetdino.com/"
  url "https://github.com/asdf9384/dino-releases/releases/download/v0.0.1/dino-0.0.1-darwin-arm64.tar.gz"
  version "0.0.1"
  sha256 "3edca01b9dec484920d2b91e0d77947d12b3b59c9e88bc1b30f5b81314dce25e"
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
