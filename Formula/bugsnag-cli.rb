class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.1/x86_64-macos-bugsnag-cli"
      sha256 "b641a99411cf45ace1a6019d76c0789dcdf151b99114d87566b17f39eeacd7ea"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.1/arm64-macos-bugsnag-cli"
      sha256 "1e1be1cf320876c7b540e173faac0daba615a6d0eb66a8a48ad19dcf2cceaee7"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.1/x86_64-linux-bugsnag-cli"
      sha256 "f32bc075ad4667102cae1c6d61970af81f7a8989bb392604f471a0bb7a3bd5c0"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.1/arm64-linux-bugsnag-cli"
      sha256 "b5a8cf8f5072110b3212cd62273a6fb793aa18adda256feb3adeabb7675d5217"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.1/i386-linux-bugsnag-cli"
      sha256 "86d50126c30196b4e114643b6e45bd4fc76665a9c02d664467af6c4d5ea9fbf0"
    end
  end

  def install
    cli_name =
      if OS.mac?
        if Hardware::CPU.intel?
          "x86_64-macos-bugsnag-cli"
        else
          "arm64-macos-bugsnag-cli"
        end
      elsif OS.linux?
        if Hardware::CPU.intel?
          "x86_64-linux-bugsnag-cli"
        elsif Hardware::CPU.arm?
          "arm64-linux-bugsnag-cli"
        elsif Hardware::CPU.is_32_bit?
          "i386-linux-bugsnag-cli"
        end
      end

    bin.install cli_name => "bugsnag-cli"
    chmod 0755, bin/"bugsnag-cli"
  end

  test do
    system "#{bin}/bugsnag-cli", "--version"
  end
end
