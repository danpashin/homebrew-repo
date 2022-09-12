class Unxip < Formula
  desc "Fast Xcode unarchiver"
  homepage "https://github.com/saagarjha/unxip"
  version "1.1.1"
  url "https://github.com/saagarjha/unxip/releases/download/v#{version}/unxip"
  sha256 "76cc29b590d22487d382c662e38aeb558f3fef0449edeb85ff2e404904fc5ffd"
  license "GPL-3.0"

  def install
    bin.install "unxip"
  end
end
