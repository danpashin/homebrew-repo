class Zsign < Formula
  desc "Maybe is the most quickly codesign alternative for iOS12+ in the world"
  homepage "https://github.com/zhlynn/zsign"
  url "https://github.com/zhlynn/zsign.git",
      revision: "a284e2568d6e0159735af03f33be58aae850bc9e"
  version "1.0"
  revision 1
  license "BSD-3-Clause"
  head "https://github.com/zhlynn/zsign.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "openssl@3"

  on_linux do
    depends_on "pkg-config" => :build
  end

  def install
    # Allow executing `brew` command. This is used in macOS only
    on_macos do
      ENV.prepend "PATH", "#{HOMEBREW_PREFIX}/bin:"
    end

    system "cmake", buildpath.to_s, "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--target", "zsign"

    bin.install "build/zsign"
  end
end
