class Zsign < Formula
  desc "Maybe is the most quickly codesign alternative for iOS12+ in the world"
  homepage "https://github.com/zhlynn/zsign"
  url "https://github.com/zhlynn/zsign/archive/27016df1150eeaf27e8d8c148ccb3cad10d31e73.tar.gz"
  version "1.0"
  sha256 "b3dc8ea5363e494b7daa704f7cdb52914399d6334451e7cfe4ecfb186e65dc9b"
  head "https://github.com/zhlynn/zsign.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "openssl"

  def install
    ENV["LDFLAGS"] = "-L#{Formula["openssl"].lib} -lcrypto"

    system "cmake", buildpath.to_s, "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--target", "zsign"

    bin.install "build/zsign"
  end
end
