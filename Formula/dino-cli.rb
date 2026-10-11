# frozen_string_literal: true

# dino's command-line client and dinod, without the terminal app.
class DinoCli < Formula
  desc "Command-line client and daemon for the dino terminal"
  homepage "https://meetdino.com/"
  url "https://github.com/meetdino/dino/releases/download/v0.1.12/dino-0.1.12-darwin-arm64.tar.gz"
  version "0.1.12"
  sha256 "76b4f35c57f5e49b9e67a4de769065097412aca7025e6c49fdc68771b8436a66"
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
    # The licenses of the code in it, beside LICENSE (which Homebrew keeps on its own).
    prefix.install "THIRD_PARTY_NOTICES.md"
    # Tab completion, in the folders bash, zsh and fish load completions from.
    generate_completions_from_executable(bin/"dino", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dino --version")
  end
end
