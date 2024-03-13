class GutenbergBlocks < Formula
  desc "Script for instantiating and pulling Gutenberg blocks"
  homepage "https://github.com/burovoordeboeg/gutenberg-block-installer/"
  url "https://github.com/burovoordeboeg/gutenberg-block-installer/archive/refs/tags/v0.0.2.zip"
  license "MIT"

  def install
    system "curl", "-o", "gutenberg-blocks.zip", "-L", "https://github.com/burovoordeboeg/gutenberg-block-installer/archive/refs/tags/v0.0.2.zip"
    system "unzip", "-q", "gutenberg-blocks.zip"
    bin.install "gutenberg-block-installer-0.0.2/gutenberg-blocks.sh" => "gutenberg-blocks"
  end
end