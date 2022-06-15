class Sstrip < Formula
  desc "sstrip is a small utility that removes as much as possible from an ELF file without affecting the file's memory image"
  homepage "https://github.com/aunali1/super-strip"
  url "https://github.com/aunali1/super-strip/archive/refs/tags/3.0a.tar.gz"
  version "3.0-a"
  sha256 "b8c4864c3387576349cf7576d8968e0c87c8106c98511a31f28e175d016e8f54"
  head "https://github.com/aunali1/super-strip.git", branch: "master"

  on_macos do
    resource("elf-header") do
      url "https://gist.githubusercontent.com/mlafeldt/3885346/raw/b6166a889846dc0612f4227fa3d32554870bb922/elf.h"
      sha256 "a3cba059e9016ece68f1ca17af1b629527ccd62486f8370d7cffaece87e4f7ab"
    end
  end

  def install
    on_macos do
      resource("elf-header").stage { buildpath.install "elf.h" }

      inreplace "elfrw/Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I../"
      end

      inreplace "Makefile" do |s|
        s.gsub! "CFLAGS =", "CFLAGS = -I./"
      end
    end

    system "make"

    bin.install "sstrip"
    man1.install "sstrip.1"
  end
end
