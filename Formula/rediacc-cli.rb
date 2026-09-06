class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "1.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-arm64"
      sha256 "bb675f6cc293b02b0c563e010aa3b702088412c4fa9adac25def00bde9b74820"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-x64"
      sha256 "02132b570095ccac6974763e09bf5fad633ad8312e661055f7717c41b7a58ea5"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-arm64"
      sha256 "641f2f4d540e3eb9ac8a4bda712eaeb791345d876504cb43259fe0fdf4d9446d"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-x64"
      sha256 "48ebb8987c568dbdfd4dd9b1694545e01b6408667dd7b5079dd51edb67ba2973"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
