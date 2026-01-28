class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "0.4.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-arm64"
      sha256 "5657644ab6a149a5bfd9eb6d260bd1d14201a957adaf006d05ddda2afc7cee4b"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-x64"
      sha256 "42b2e00dbec44ce2af906cf3aaafe7ebe704c1f12ad8377d850232dfb8bec702"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-arm64"
      sha256 "9d89347b8deb10eeb07a88e956d177de319c287a3397a15832759764eb2db265"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-x64"
      sha256 "a6c2070e997e50223e0412784885711263830406cee47581149ff29347d111d1"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
