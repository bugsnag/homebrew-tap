class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.3/x86_64-macos-bugsnag-cli"
      sha256 "a7fe26bca91bd3702405d111d4e3184ec79acbe4fabc4d2b149ce026e6ff8d86"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.3/arm64-macos-bugsnag-cli"
      sha256 "57173da2ece346ce12eff532aba09c127b470249aac671d2a3b79b4b34ce23e0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.3/x86_64-linux-bugsnag-cli"
      sha256 "a048d3cba96e33dd9e823264aed078e298808fc96c05fed4fdcace41db1743a9"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.3/arm64-linux-bugsnag-cli"
      sha256 "bc95d2a75fa9d65e451e08c9412a09c4288a25ead81c4bef8e706156cd6dff95"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.3/i386-linux-bugsnag-cli"
      sha256 "5a8ad026865709b4e6f89d46a758aa570f4eaf12e2f772a85d23fcab23a9568a"
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
