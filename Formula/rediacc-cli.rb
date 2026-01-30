class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "0.4.75"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-arm64"
      sha256 "ea2b3746e235cce68107de9bb5b22be597fb542a91348117c12de20083496905"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-x64"
      sha256 "c0060084a13abdd8eea347b680c10a630dfadbfc0ba7ddd12e625c46a645ead6"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-arm64"
      sha256 "d682969ea9f36729260d01055aebe92dd67d588f92d7c69cfd431c812dcd182d"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-x64"
      sha256 "1ecc359cb49b760a58edde1f0cad5fb49c0d69441f89d69aff29b339c7f07604"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
