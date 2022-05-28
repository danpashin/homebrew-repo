class InsertDylib < Formula
  desc "Maybe is the most quickly codesign alternative for iOS12+ in the world"
  homepage "https://github.com/Tyilo/insert_dylib"
  url "https://github.com/Tyilo/insert_dylib.git", revision: "c8beef66a08688c2feeee2c9b6eaf1061c2e67a9"
  version "1.0"

  def install
    Dir.mkdir "build"
    system ENV.cc.to_s, "-o", "build/insert_dylib", "-O3", "insert_dylib/main.c"
    bin.install "build/insert_dylib"
  end
end
