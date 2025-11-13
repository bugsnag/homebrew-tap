class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.1/x86_64-macos-bugsnag-cli"
      sha256 "bac2e2877e8b216071cf7c4cd57ebdc577db43a28b21a6fc57c1dde53814e925"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.1/arm64-macos-bugsnag-cli"
      sha256 "48fa68acc19e20415ac4badb7a593b6eceb6123d43179e1ff10228a6f1d1d5f0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.1/x86_64-linux-bugsnag-cli"
      sha256 "5eb5431b4ab8f96b9dfc52d9f87c507aee1e141c609e414a8e891bee490be461"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.1/arm64-linux-bugsnag-cli"
      sha256 "fce2b934d7912143e32d3a1723a3797f2939fc3f19e88fe6ffbdf3675cc5f1b5"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.1/i386-linux-bugsnag-cli"
      sha256 "9c87be599beb54bfe3add13003e9c63e345d872b25a107136669c2e2417afe4a"
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
