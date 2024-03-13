class GutenbergBlocks < Formula
    desc "Script for instantiating and pulling Gutenberg blocks"
    homepage "https://github.com/burovoordeboeg/gutenberg-block-installer/"
    url "https://github.com/burovoordeboeg/gutenberg-block-installer/blob/v0.0.2/versions/v0.0.2.tar.gz"
    sha256 "8592c9c2215f2dc8f711adbbc46dcbc029edc35598c1b6453f9e14046ee99378"
    license "MIT"
  
    def install
      bin.install "gutenberg-blocks.sh" => "gutenberg-blocks"
    end
  end
  