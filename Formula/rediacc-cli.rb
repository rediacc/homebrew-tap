class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "0.4.86"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-arm64"
      sha256 "9aa38132ed7878a895752a06727f9ee33934af011dfd4542f38aedd5864ee648"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-mac-x64"
      sha256 "0c0780cde15174f3e1a0d67c18f8557025eea553848419d943f9c0bf69eb5220"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-arm64"
      sha256 "acde20fb97dcdda82ae839ef6788b87f586f79915f31f361fae7293cde4c5d76"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://github.com/rediacc/console/releases/download/v#{version}/rdc-linux-x64"
      sha256 "193db621ce32a60f75ac3ead9ffceb7360967ee8d92664a1a0e62cc7472a77b7"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
