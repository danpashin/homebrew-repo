class Mustache < Formula
  desc "Mustache text templates for modern C++"
  homepage "https://github.com/kainjow/Mustache"
  url "https://github.com/kainjow/Mustache/archive/refs/tags/v4.1.tar.gz"
  version "4.1"
  sha256 "acd66359feb4318b421f9574cfc5a511133a77d916d0b13c7caa3783c0bfe167"
  head "https://github.com/kainjow/Mustache.git", branch: "master"

  def install
    include.install "mustache.hpp"
  end
end
