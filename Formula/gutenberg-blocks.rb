class GutenbergBlocks < Formula
  desc "Script for instantiating and pulling Gutenberg blocks"
  homepage "https://github.com/burovoordeboeg/gutenberg-block-installer"
  url "https://github.com/burovoordeboeg/gutenberg-block-installer/archive/refs/tags/v0.0.3.zip"
  license "MIT"
  version: "0.0.3"

  def install
    system "unzip", "-q", "gutenberg-blocks.zip"
    bin.install "gutenberg-block-installer-0.0.3/scripts/gutenberg-blocks.sh" => "gutenberg-blocks"
  end
end