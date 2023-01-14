cask "ipatool-114" do
  if Hardware::CPU.arm?
    sha256 :no_check
    url "https://github.com/majd/ipatool/releases/download/v1.1.4/ipatool-macos-v1.1.4.zip"
    binary "ipatool", target: "ipatool"
  else
    sha256 :no_check
    url "https://github.com/majd/ipatool/releases/download/v1.1.4/ipatool-macos-v1.1.4.zip"
    binary "ipatool", target: "ipatool"
  end

  version "1.1.4"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
