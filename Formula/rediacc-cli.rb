class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "0.4.78"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-arm64"
      sha256 "b6ec7544a3d4e6529f8e2b03f13d3374f31361558a4bd5be611bd61207eac574"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-x64"
      sha256 "84633cbf54cb2cce4c694f73efe0c7319d9cef2a363b49b252dc9f74ee3d8bf7"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-arm64"
      sha256 "d2c62b9e22b6338811997c656f9e58de7f76fe7fe4db86260f58ef820a6aafe1"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-x64"
      sha256 "746764777ca49df712ddc5c6fb95dcd3c7fa85e932e718247c4d58b5d82d9bc5"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
