class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "0.4.97"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-arm64"
      sha256 "0fd91a3a620a46d2aedf8f5235c7ed36909ca8bb73d16b8c1384fec2bee5f7f9"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-x64"
      sha256 "9125cdc5e8094b7b2a5f412cacf7ed5195260591946f3716012d3ba5672cb6e2"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-arm64"
      sha256 "919205194cfdbf4893fe0d0bc00f6d44292938561bffe355142a4bc2571787cd"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-x64"
      sha256 "fced31b40500abf382b6ccad8c7af11b9a4abf03202912eb1deadc91f6d763c3"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
