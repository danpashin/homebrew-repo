class ZimTools < Formula
  desc "Various ZIM command-line tools"
  homepage "https://github.com/openzim/zim-tools"
  version "3.4.0"
  url "https://github.com/openzim/zim-tools/archive/refs/tags/#{version}.tar.gz"
  sha256 "20e686e834867f33e35e6a48f5b4ddc5dc83842340ba3281c611fca9859e8f99"
  license "GPL-3.0-or-later"
  head "https://github.com/openzim/zim-tools.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "mustache" => :build
  depends_on "ninja" => :build
  depends_on "docopt"
  depends_on "gumbo-parser"
  depends_on "libmagic"
  depends_on "libzim"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end
end
