class Libzim < Formula
  desc "Reference implementation of the ZIM specification"
  homepage "https://github.com/openzim/libzim"
  version "8.0.0"
  url "https://github.com/openzim/libzim/archive/refs/tags/#{version}.tar.gz"
  sha256 "a408810c9316b56b410f6878a488f7d821c9b7eb3983e0114a4ab1a50394f7d2"
  license "GPL-2.0-only"
  head "https://github.com/openzim/libzim.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "icu4c"
  depends_on "xapian"
  depends_on "xz"
  depends_on "zstd"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end
end
