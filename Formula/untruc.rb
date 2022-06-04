class Untruc < Formula
  desc "NewNode decentralized Content Distribution Network"
  homepage "https://github.com/anthwlock/untrunc"
  url "https://github.com/anthwlock/untrunc/archive/d72ec324fbc29eb00b53c7dafeef09f92308962b.tar.gz"
  version "0.1.0"
  sha256 "d8a35992e1f4375ce94048c23cdf3d7034396123da253275d30983ab6884b559"
  head "https://github.com/anthwlock/untrunc.git", branch: "master"

  depends_on "ffmpeg@4"

  def install
    system "make"
    bin.install "untrunc"
  end
end
