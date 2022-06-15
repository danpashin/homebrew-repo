class Elfkickers < Formula
  desc "A collection of programs that access and manipulate ELF files."
  homepage "https://github.com/BR903/ELFkickers"
  url "https://github.com/BR903/ELFkickers/archive/e7fba942df51e756897224cff5aa853de8fafd90.tar.gz"
  version "3.2"
  sha256 "40a0446ad82670510ca1d13ae73352971e3040ae1591382198a2b7a44794a245"
  head "https://github.com/BR903/ELFkickers.git", branch: "master"

  on_macos do
    resource("elf-header") do
      url "https://gist.githubusercontent.com/mlafeldt/3885346/raw/b6166a889846dc0612f4227fa3d32554870bb922/elf.h"
      sha256 "a3cba059e9016ece68f1ca17af1b629527ccd62486f8370d7cffaece87e4f7ab"
    end
  end

  def install
    on_macos do
      resource("elf-header").stage { buildpath.install "elf.h" }

      inreplace "ebfc/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "elfls/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "elfrw/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "elftoc/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
        s.gsub! "$(CPP)", "$(CPP) -I../"
      end

      inreplace "infect/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "objres/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "rebind/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "sstrip/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end
    end

    system "make", "install", "prefix=#{prefix}"

    bin.install "elftoc/mknames"
    lib.install "elfrw/libelfrw.a"
    lib.install "ebfc/libelfparts.a"
  end
end
