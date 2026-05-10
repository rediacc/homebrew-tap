class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "1.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-arm64"
      sha256 "cdfa803928bac7ec58163096e1cf131b89481a6b4d050539081a070a9d622192"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-x64"
      sha256 "48e6abfad672648e39ba7cd4265b298bf4f272078f31a373a8e2e6680738b963"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-arm64"
      sha256 "b6eda25141d5b9ebb56f5800170b26cbd36fcc6ca26b5bfa2c197cca3cb388e0"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-x64"
      sha256 "65c0b3610dce645cff597971038424c552b54a543a2471e5da5cd5c64af14357"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
