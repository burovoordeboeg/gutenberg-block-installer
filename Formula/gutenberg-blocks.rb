class GutenbergBlocks < Formula
  desc "Script for instantiating and pulling Gutenberg blocks"
  homepage "https://github.com/burovoordeboeg/gutenberg-block-installer"

  credential_helper = "/usr/local/bin/git-credential-osxkeychain"
  url "https://github.com/burovoordeboeg/gutenberg-block-installer.git",
      using: :git, tag: "v0.0.4",
      credential_helper: credential_helper

  license "MIT"
  version "0.0.4"

  def install
    system "unzip", "-q", "gutenberg-blocks.zip"
    bin.install "gutenberg-block-installer-0.0.4/scripts/gutenberg-blocks.sh" => "gutenberg-blocks"
  end
end