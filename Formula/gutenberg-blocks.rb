class GutenbergBlocks < Formula
  desc "Script for instantiating and pulling Gutenberg blocks"
  homepage "https://github.com/burovoordeboeg/gutenberg-block-installer"

  credential_helper = "/usr/local/bin/git-credential-osxkeychain"
  url "https://github.com/burovoordeboeg/homebrew-gutenberg-block-installer/archive/refs/tags/v0.0.5.zip"

  license "MIT"
  version "0.0.5"

  def install
    cd buildpath/"homebrew-gutenberg-block-installer-0.0.5" do
      system "unzip", "-q", "homebrew-gutenberg-block-installer-0.0.5.zip"
      bin.install "scripts/gutenberg-blocks.sh" => "gutenberg-blocks"
    end
  end
end