class ZimTools < Formula
  desc "Various ZIM command line tools"
  homepage "https://github.com/openzim/zim-tools"
  url "https://github.com/openzim/zim-tools/archive/refs/tags/3.1.1.tar.gz"
  version "3.1.1"
  sha256 "980352ded328cadb41fce43706b679065b4933169d3909e82ea52b07e2cc18d5"
  head "https://github.com/openzim/zim-tools.git", branch: "master"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build
  depends_on "mustache" => :build
  depends_on "libzim"
  depends_on "gumbo-parser"
  depends_on "libmagic"
  depends_on "docopt"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end
end
