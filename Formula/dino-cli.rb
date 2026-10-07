# frozen_string_literal: true

# dino's command-line client and dinod, without the terminal app.
class DinoCli < Formula
  desc "Command-line client and daemon for the dino terminal"
  homepage "https://meetdino.com/"
  url "https://github.com/meetdino/dino/releases/download/v0.1.7/dino-0.1.7-darwin-arm64.tar.gz"
  version "0.1.7"
  sha256 "1ad26c10fbaccdda76c56d5fd22be44c30855c1d5dbe7b3b7fca258c6689baed"
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
