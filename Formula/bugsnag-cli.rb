class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.4/x86_64-macos-bugsnag-cli"
      sha256 "c4b00dfa6d9cbf263e077c2a44ed681fa4fa752890037e7ded083f620aa181d8"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.4/arm64-macos-bugsnag-cli"
      sha256 "efa88045e377005c4dba824f48e7f0048666ea21da685f986801a8e34dad1092"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.4/x86_64-linux-bugsnag-cli"
      sha256 "3f28e8192d3d8ff89b10953e6678a38cbb78596469c206e21e51c87fef429dc7"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.4/arm64-linux-bugsnag-cli"
      sha256 "9bf73832c6d2c9d4553cb19aa7ff83af0c2e8aed98e66e9ca91a7c03e3ff38b0"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.4/i386-linux-bugsnag-cli"
      sha256 "4931ccec4cac0c601fb5863f5aa60cfa145b8c46461abc3f6f97ef67b7d52226"
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
