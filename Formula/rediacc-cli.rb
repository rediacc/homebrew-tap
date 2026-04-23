class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-arm64"
      sha256 "30536c46ad6f22ecf98248c30de3abc59f7e608738888416fb5e0dfa8766a0b3"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-x64"
      sha256 "7351dcfce84bdbaf0571fbc0d6424c6922a54e2a2f80e940d8a39cb9dae04d3b"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-arm64"
      sha256 "4e0ddaee1cf656d788ab96d5a172b97d69df902935b136738a061fb62412d257"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-x64"
      sha256 "090e344011eed8596a45514271fc0de65dd82aa18e37f9663c90d72355d06875"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
