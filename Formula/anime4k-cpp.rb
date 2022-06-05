class Anime4kCpp < Formula
  desc "A high performance anime upscaler"
  homepage "https://github.com/TianZerL/Anime4KCPP"
  url "https://github.com/TianZerL/Anime4KCPP/archive/1201ee73d2664c727d4e60f546c13abf757b0aef.tar.gz"
  version "2.6.0-dev"
  sha256 "9369b027dbf533f12a9136724d89edddb69a7a1799e6a20ac6033da4fde33d21"
  head "https://github.com/TianZerL/Anime4KCPP.git", branch: "master"

  option "with-gui", "Build with GUI tool"

  depends_on "cmake" => :build
  depends_on "llvm" => :build
  depends_on "qt5" if build.with? "gui"
  depends_on "opencv"

  def install
    args = [
      "-DCMAKE_C_COMPILER=#{Formula["llvm"].bin}/clang",
      "-DCMAKE_CXX_COMPILER=#{Formula["llvm"].bin}/clang++",
    ]
    args << "-DBuild_GUI=ON" if build.with? "gui"

    on_macos do
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
