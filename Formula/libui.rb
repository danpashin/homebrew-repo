class Libui < Formula
  desc "Simple and portable GUI library in C"
  homepage "https://github.com/libui-ng/libui-ng"
  url "https://github.com/libui-ng/libui-ng/archive/a850e7ac1e9ca70529f178394d736593c250b5e8.tar.gz"
  version "0.4.1-a"
  sha256 "ccf1dd004d35966b219f4e05ae8b1bdeec55d984dbfc2759c0091fc86e213ea8"
  license "MIT"
  head "https://github.com/libui-ng/libui-ng.git", branch: "master"

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
