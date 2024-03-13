class GutenbergBlocks < Formula
    desc "Script for instantiating and pulling Gutenberg blocks"
    homepage "https://github.com/burovoordeboeg/gutenberg-block-installer/"
    sha256 "e5f1b04195194c7d0ddc215d6ef68b659df79cd9"
    license "MIT"
    version "0.0.2"
  
    def install
      system "curl", "-o", "gutenberg-blocks.tar.gz", "-A", "bvdb", "https://plugins.burovoordeboeg.nl/gutenberg-blocks.tar.gz"
      bin.install "gutenberg-blocks.sh" => "gutenberg-blocks"
    end
  end
  