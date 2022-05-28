class Clolcat < Formula
  desc "Rainbows and unicorns in your console!"
  homepage "https://github.com/jaseg/lolcat"
  url "https://github.com/jaseg/lolcat/archive/8173ed8cb62f22ca2ebb33a63b5b9954afb20d7e.tar.gz"
  version "1.2"
  sha256 "38f955399a77144eb605f3acfa07a5bba77e2885131550d3f728de3f394ec268"
  head "https://github.com/jaseg/lolcat.git", branch: "main"

  conflicts_with "lolcat", because: "clolcat is modern alternative to old lolcat"

  def install
    system "make"
    bin.install "lolcat"
  end
end
