class Untrunc < Formula
  desc "Restore a truncated mp4/mov. Improved version of ponchio/untrunc"
  homepage "https://github.com/anthwlock/untrunc"
  url "https://github.com/anthwlock/untrunc/archive/d72ec324fbc29eb00b53c7dafeef09f92308962b.tar.gz"
  version "0.1.0"
  sha256 "d8a35992e1f4375ce94048c23cdf3d7034396123da253275d30983ab6884b559"
  head "https://github.com/anthwlock/untrunc.git", branch: "master"

  option "with-gui", "Compile with GUI support"
  depends_on "ffmpeg@4"
  depends_on "libui" if build.with? "gui"

  def install
    system "make"
    bin.install "untrunc"

    if build.with? "gui"
      system "make", "untrunc-gui"
      bin.install "untrunc-gui"
    end
  end
end
