class RediaccCli < Formula
  desc "Rediacc CLI - automation and scripting tool"
  homepage "https://www.rediacc.com"
  version "1.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-arm64"
      sha256 "cebae06bbce2dbc2df858e16645500b7978cca95e19e876088dfe901275e0a0f"

      def install
        bin.install "rdc-mac-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-mac-x64"
      sha256 "c20d0135f8e003f20dfdecb2fb14d9d22dcec99b5324d5d51df5b3d969b2af11"

      def install
        bin.install "rdc-mac-x64" => "rdc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-arm64"
      sha256 "0efe8fec5251ad54417034d620dfcdf8e48153129cf1a8c51cd230701bc1fc50"

      def install
        bin.install "rdc-linux-arm64" => "rdc"
      end
    else
      url "https://releases.rediacc.com/cli/v#{version}/rdc-linux-x64"
      sha256 "a52a781669044c02d0cafc7cf88cb1bafe4b16ad18e6507d2d42152094f7aded"

      def install
        bin.install "rdc-linux-x64" => "rdc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdc --version")
  end
end
