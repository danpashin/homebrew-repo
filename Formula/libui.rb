class Libui < Formula
  desc "Simple and portable GUI library in C"
  homepage "https://github.com/libui-ng/libui-ng"
  url "https://github.com/libui-ng/libui-ng/archive/9e57bdd2a36ac44817f9a14c556c5214956ffd73.tar.gz"
  version "0.4.1-a-9e57bdd2"
  sha256 "ed7fb7f89225c419f4c63fd27311cd4d3c4012b7f0bcb8bbb3807c6edff51853"
  license "MIT"
  head "https://github.com/libui-ng/libui-ng.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "cmocka" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build

  on_linux do
    depends_on "gtk+3" => :build
    depends_on "gdk-pixbuf" => :build
    depends_on "atk" => :build
    depends_on "glib" => :build
    depends_on "pango" => :build
    depends_on "harfbuzz" => :build
    depends_on "cairo" => :build
  end

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end
end
