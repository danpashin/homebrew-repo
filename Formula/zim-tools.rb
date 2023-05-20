class ZimTools < Formula
  desc "Various ZIM command-line tools"
  homepage "https://github.com/openzim/zim-tools"
  version "3.2.0"
  url "https://github.com/openzim/zim-tools/archive/refs/tags/#{version}.tar.gz"
  sha256 "ba67da31da199ff8c759ca156501d216a5175fcea72b7e7e6b7b358e5de4af54"
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
