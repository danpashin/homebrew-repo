class Untrunc < Formula
  desc "Restore a truncated mp4/mov. Improved version of ponchio/untrunc"
  homepage "https://github.com/anthwlock/untrunc"
  url "https://github.com/anthwlock/untrunc/archive/13cafedf59369db478af537fb909f0d7fd0eb85f.tar.gz"
  version "0.1.0"
  sha256 "dde668893161ef82241b1ad87405be299786cca39f2a7482ffd95fa1652a19a3"
  license :public_domain
  head "https://github.com/anthwlock/untrunc.git", branch: "master"

  option "with-gui", "Compile with GUI support"
  depends_on "ffmpeg@6"
  depends_on "libui" if build.with? "gui"

  on_linux do
    depends_on "make" => :build
  end

  def install
    system "make"
    bin.install "untrunc"

    if build.with? "gui"
      system "make", "untrunc-gui"
      bin.install "untrunc-gui"
    end
  end
end
