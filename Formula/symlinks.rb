class Symlinks < Formula
  desc "Symbolic link maintenance utility"
  homepage "https://github.com/brandt/symlinks"
  url "https://github.com/brandt/symlinks/archive/e22cde5c1c5ce5ebef0173993dc67e3e9c811c33.tar.gz"
  version "1.0"
  sha256 "ac00a5a0b5df8a9166531cf5e988698bdcc515024b61a862dc32d0be485ba9a8"
  head "https://github.com/brandt/symlinks.git", branch: "master"

  def install
    system ENV.cc.to_s, "-o", "symlinks", "-O3", "symlinks.c"
    bin.install "symlinks"
    man8.install "symlinks.8"
  end
end
