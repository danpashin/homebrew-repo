class Dylibify < Formula
  desc "Transform any ARM macho executable to a dynamic library"
  homepage "https://github.com/jakeajames/dylibify"
  url "https://github.com/jakeajames/dylibify/archive/11bc14ec705a1493160b9e8bdeb3b6e8cee2bc49.tar.gz"
  version "1.0"
  sha256 "5b72e2a382b55c069d3877975db2fee823f505ab3ec738263821855cecef8321"
  license :public_domain
  head "https://github.com/jakeajames/dylibify.git", branch: "master"

  def install
    system ENV.cc.to_s, "-framework", "Foundation", "-fobjc-arc", "-o", "dylibify", "main.m"
    bin.install "dylibify"
  end
end
