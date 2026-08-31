class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "1.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-arm64"
      sha256 "2fca495f4b7562fabdd439e9dcf4cc5d1fb144347bfb5715e7fac739dbfe4721"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-x64"
      sha256 "36a285da6b347f0fcebb204fd3e7e8f7063d73a4ce902fd14f283568ff6b92d9"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-arm64"
      sha256 "cfbfa6ef2abcc6210c6bdc28f86912cdfc9881f747f0ba150658d3fd6995d91d"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-x64"
      sha256 "b816dfbfc5a52e90ead8a3c96de28fe21d99bd555418a195df5e2ff6772107e5"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
