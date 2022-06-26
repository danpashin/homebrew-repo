class Tbd < Formula
  desc "CLI tool to create TAPI files from existing binaries"
  homepage "https://github.com/inoahdev/tbd"
  url "https://github.com/inoahdev/tbd/archive/30a6883092221e13d814c02ac41af1e565a40617.tar.gz"
  version "2.2"
  sha256 "c1c37282c90365ddae0c80a8b05e0fd1dc5a66c4304a687213c79289e698249e"
  license "MIT"
  head "https://github.com/inoahdev/tbd.git", branch: "master"

  def install
    system "make"
    bin.install "bin/tbd"
  end
end
