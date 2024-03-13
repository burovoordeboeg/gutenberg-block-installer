class GutenbergBlocks < Formula
    desc "Script for instantiating and pulling Gutenberg blocks"
    homepage "https://github.com/burovoordeboeg/gutenberg-block-installer/"
    url "https://github.com/burovoordeboeg/gutenberg-block-installer/archive/refs/tags/v0.0.2.tar.gz"
    sha256 "cf7ef76a97bba410cf39f6fe27af87f5ddbbbc9a8f7b356576814aa07c2251c1"
    license "MIT"
  
    def install
      bin.install "gutenberg-blocks.sh" => "gutenberg-blocks"
    end
  end
  