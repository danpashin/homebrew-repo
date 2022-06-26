class Libzim < Formula
  desc "Reference implementation of the ZIM specification"
  homepage "https://github.com/openzim/libzim"
  url "https://github.com/openzim/libzim/archive/refs/tags/#{version}.tar.gz"
  version "7.2.2"
  sha256 "42f7f19ca50b2185fe91ea91bd676976b7e282ca31c1a70f409d2689788ee59b"
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
