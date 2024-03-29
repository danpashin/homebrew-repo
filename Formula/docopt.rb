class Docopt < Formula
  desc "C++11 port of docopt"
  homepage "https://github.com/docopt/docopt.cpp"
  version "0.6.3"
  url "https://github.com/docopt/docopt.cpp/archive/refs/tags/v#{version}.tar.gz"
  sha256 "28af5a0c482c6d508d22b14d588a3b0bd9ff97135f99c2814a5aa3cbff1d6632"
  license any_of: ["MIT", "BSL-1.0"]
  head "https://github.com/docopt/docopt.cpp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", buildpath.to_s, "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "#{buildpath}/build", "--prefix", prefix.to_s
  end
end
