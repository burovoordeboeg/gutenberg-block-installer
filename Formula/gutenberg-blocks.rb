class GutenbergBlocks < Formula
    desc "Script for instantiating and pulling Gutenberg blocks"
    homepage "https://github.com/burovoordeboeg/gutenberg-block-installer/"
    url "https://github.com/burovoordeboeg/gutenberg-block-installer/blob/v0.0.2/versions/v0.0.2.tar.gz"
    license "MIT"
  
    def install
      bin.install "gutenberg-blocks.sh" => "gutenberg-blocks"
    end
  end
  