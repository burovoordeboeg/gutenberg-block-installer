class GutenbergBlocks < Formula
    desc "Script for instantiating and pulling Gutenberg blocks"
    homepage "https://github.com/burovoordeboeg/gutenberg-block-installer/"
    url "https://github.com/burovoordeboeg/gutenberg-block-installer/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "67dc3f07c92aeb322aa0c3594e740662754be6549b454687144eaf4207e5ddda"
    license "MIT"
  
    def install
      bin.install "gutenberg-blocks.sh" => "gutenberg-blocks"
    end
  end
  