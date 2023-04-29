class Clolcat < Formula
  desc "Rainbows and unicorns in your console!"
  homepage "https://github.com/jaseg/lolcat"
  url "https://github.com/jaseg/lolcat/archive/dc3ddf395017bf903f5bfb8f0c5c6d08d84fcdc0.tar.gz"
  version "1.4"
  sha256 "1e24aa6122017445a7e052782b6f7ea187d40e864b3787e20aae4a62a4b0e62b"
  license "WTFPL"
  head "https://github.com/jaseg/lolcat.git", branch: "main"

  conflicts_with "lolcat", because: "clolcat is modern alternative to old lolcat"

  def install
    system "make"
    bin.install "lolcat"
  end
end
