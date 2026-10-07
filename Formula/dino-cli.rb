# frozen_string_literal: true

# dino's command-line client and dinod, without the terminal app.
class DinoCli < Formula
  desc "Command-line client and daemon for the dino terminal"
  homepage "https://meetdino.com/"
  url "https://github.com/meetdino/dino/releases/download/v0.1.8/dino-0.1.8-darwin-arm64.tar.gz"
  version "0.1.8"
  sha256 "8e3f780f7567f2122bb61a86d1fd9dfe68810a1130e91aebb2dd43e97e0c7ba6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  conflicts_with cask: "dino", because: "the dino app includes the dino command"

  def install
    bin.install "dino"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dino --version")
  end
end
