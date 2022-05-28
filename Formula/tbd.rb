class Tbd < Formula
  desc "CLI tool to create TAPI files from existing binaries"
  homepage "https://github.com/inoahdev/tbd"
  url "https://github.com/inoahdev/tbd.git", revision: "30a6883092221e13d814c02ac41af1e565a40617"
  version "2.2"

  def install
    system "make"
    bin.install "bin/tbd"
  end
end
