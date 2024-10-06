class Libui < Formula
  desc "Simple and portable GUI library in C"
  homepage "https://github.com/libui-ng/libui-ng"
  url "https://github.com/libui-ng/libui-ng/archive/49b04c4cf8ae4d3e38e389f446ef75170eb62762.tar.gz"
  version "0.4.1-a-49b04c4"
  sha256 "d7abb6e08de95df27e66491f50aed6b671d5da04cd484cfbff2201b69b8ef495"
  license "MIT"
  head "https://github.com/libui-ng/libui-ng.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "cmocka" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build

  on_linux do
    depends_on "gtk+3"
    depends_on "gdk-pixbuf"
    depends_on "at-spi2-core"
    depends_on "glib"
    depends_on "pango"
    depends_on "harfbuzz"
    depends_on "cairo"
  end

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end
end
