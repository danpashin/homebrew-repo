class Zsign < Formula
  desc "Maybe is the most quickly codesign alternative for iOS12+ in the world"
  homepage "https://github.com/zhlynn/zsign"
  url "https://github.com/zhlynn/zsign.git", revision: "27016df1150eeaf27e8d8c148ccb3cad10d31e73"
  version "1.0"

  depends_on "cmake" => :build
  depends_on "openssl"

  def install
    ENV["LDFLAGS"] = "-L#{Formula["openssl"].lib} -lcrypto"

    system "cmake", buildpath.to_s, "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--target", "zsign"

    bin.install "build/zsign"
  end
end
