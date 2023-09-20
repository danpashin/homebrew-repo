class MachoParser < Formula
  desc "Mach-O parser from @qyang-nj"
  homepage "https://github.com/qyang-nj/llios"
  url "https://github.com/qyang-nj/llios/archive/64096903d87261ee1fab08b6538dc0a9cc1e8242.tar.gz"
  version "1.0"
  sha256 "4a1b86c36c778418c4a583c38ad0133c9368af83575cfeebe3fef337ca45eddb"
  head "https://github.com/qyang-nj/llios.git", branch: "main"

  depends_on "bazelisk" => :build

  def install
    cd "macho_parser" do
      system "bazel", "build", "//:macho_parser"
      bin.install "bazel-bin/macho_parser"
    end
  end
end
