class Anime4kCpp < Formula
  desc "High performance anime upscaler"
  homepage "https://github.com/TianZerL/Anime4KCPP"
  url "https://github.com/TianZerL/Anime4KCPP/archive/23473f01eb0e22d32e369812c686c695522341ec.tar.gz"
  version "2.6.0-dev_23473f01"
  sha256 "0c11d969f3395016a7aee6b63e008ef1bb1967fe032cbd6475606913f0216d4e"
  license "MIT"
  head "https://github.com/TianZerL/Anime4KCPP.git", branch: "master"

  option "with-gui", "Build with GUI tool"

  depends_on "cmake" => :build
  depends_on "llvm" => :build
  depends_on "opencv"
  depends_on "qt5" if build.with? "gui"

  def install
    args = [
      "-DCMAKE_C_COMPILER=#{Formula["llvm"].bin}/clang",
      "-DCMAKE_CXX_COMPILER=#{Formula["llvm"].bin}/clang++",
    ]
    args << "-DBuild_GUI=ON" if build.with? "gui"

    if OS.mac?
      inreplace "GUI/CMakeLists.txt" do |s|
        s.gsub! "TARGETS ${PROJECT_NAME}", "TARGETS ${PROJECT_NAME}\n\tBUNDLE DESTINATION anime4k"
      end
    end

    system "cmake", buildpath.to_s, "-B", "build", *std_cmake_args, *args
    system "cmake", "--build", "build"

    bin.install "build/bin/Anime4KCPP_CLI" => "anime4k"
    lib.install "build/bin/libAnime4KCPPCore.a"

    if build.with? "gui"
      bin.install "build/bin/Anime4KCPP_GUI" => "anime4k-gui" if OS.linux?
      bin.install "build/bin/Anime4KCPP_GUI.app/Contents/MacOS/Anime4KCPP_GUI" => "anime4k-gui" if OS.mac?
    end
  end
end
