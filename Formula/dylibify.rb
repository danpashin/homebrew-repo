class Dylibify < Formula
  desc "Transform any ARM macho executable to a dynamic library"
  homepage "https://github.com/jakeajames/dylibify"
  url "https://github.com/jakeajames/dylibify.git", revision: "11bc14ec705a1493160b9e8bdeb3b6e8cee2bc49"
  version "1.0"

  def install
    system ENV.cc.to_s, "-framework", "Foundation", "-fobjc-arc", "-o", "dylibify", "main.m"
    bin.install "dylibify"
  end
end
