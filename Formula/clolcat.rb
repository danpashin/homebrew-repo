class Clolcat < Formula
  desc "Rainbows and unicorns in your console!"
  homepage "https://github.com/jaseg/lolcat"
  url "https://github.com/jaseg/lolcat.git", revision: "8173ed8cb62f22ca2ebb33a63b5b9954afb20d7e"
  version "1.2"
  conflicts_with "lolcat", because: "clolcat is modern alternative to old lolcat"

  def install
    system "make"
    bin.install "lolcat"
  end
end
