class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.5/x86_64-macos-bugsnag-cli"
      sha256 "48a27bc867284b6ab4931c234382f6d6b14c8fe6a31bd52156f102b35b093e26"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.5/arm64-macos-bugsnag-cli"
      sha256 "a495ad9e9eda0b4bed2e691e920125ce8f04a6388dbe3f70c06b400735085e4a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.5/x86_64-linux-bugsnag-cli"
      sha256 "809e50875d2be62a1cb0fbed653c795bd76c74c93af616df20e6a57afc76402f"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.5/arm64-linux-bugsnag-cli"
      sha256 "b8f6222a0e662721bf262aa520e068e500ed664eabba70b54932c7f1d7fcaeb3"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.5/i386-linux-bugsnag-cli"
      sha256 "99216191ab2c36ae6806d1b38d155cfbcc6a4c315c2fd0acf5592dcbd152fad6"
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
