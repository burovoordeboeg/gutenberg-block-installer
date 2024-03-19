class GutenbergBlocks < Formula
  desc "Script for instantiating and pulling Gutenberg blocks"
  homepage "https://github.com/burovoordeboeg/gutenberg-block-installer"
  credential_helper = "/usr/local/bin/git-credential-osxkeychain"
  url "https://github.com/burovoordeboeg/homebrew-gutenberg-block-installer/"
  license "MIT"
  version "0.0.9"

  def install
    system "curl", "-o", "gutenberg-blocks.zip", "-L", "https://github.com/burovoordeboeg/homebrew-gutenberg-block-installer/archive/refs/tags/0.0.9.zip"
    system "unzip", "-q", "gutenberg-blocks.zip"
    bin.install "homebrew-gutenberg-block-installer-0.0.9/scripts/gutenberg-blocks.sh" => "gutenberg-blocks"
  end
end
