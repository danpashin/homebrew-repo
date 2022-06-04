class Libui < Formula
  desc "Simple and portable GUI library in C."
  homepage "https://github.com/andlabs/libui"
  url "https://github.com/andlabs/libui/archive/fea45b2d5b75839be0af9acc842a147c5cba9295.tar.gz"
  version "0.4.1-a"
  sha256 "9f32ff19e2eb1c5eb1a23120f69f39f1bec14a125396729db091a322c6bee8a6"
  head "https://github.com/andlabs/libui.git", branch: "master"

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
