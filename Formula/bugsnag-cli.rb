class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.0/x86_64-macos-bugsnag-cli"
      sha256 "10392d5f62e786d6833405dc476f58fbf7c2bf5dd7b922f4a1485e30c3354af7"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.0/arm64-macos-bugsnag-cli"
      sha256 "9f7017d5bca9be2c01239fc87693e44f564ac993585559aaa29a4a593498300f"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.0/x86_64-linux-bugsnag-cli"
      sha256 "ab4bac4b6855f245805f4794a5755700c1383df5b5d7cb5ab8eb0e2c0ced91ad"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.0/arm64-linux-bugsnag-cli"
      sha256 "abf1caa9e7c71aa7a7b9fe1b1c674a4c9a12d58a4badbe4cfe993a0172cde4de"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.5.0/i386-linux-bugsnag-cli"
      sha256 "1c6e107bcab577c1a5a386eed707b321848957c0d9302a7bdd2063d93cec0d27"
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
