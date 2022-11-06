class Unxip < Formula
  desc "Fast Xcode unarchiver"
  homepage "https://github.com/saagarjha/unxip"
  version "1.1.3"
  url "https://github.com/saagarjha/unxip/releases/download/v#{version}/unxip"
  sha256 "ad0755a3b01940e11e0a2c5a3d9b6721f8aeb598145fc96a40c9ec2bbc25f54a"
  license "GPL-3.0"

  def install
    bin.install "unxip"
  end
end
