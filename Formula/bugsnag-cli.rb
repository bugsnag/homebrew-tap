class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.1/x86_64-macos-bugsnag-cli"
      sha256 "42563791cefea6ddaed1db91c2c18f9fdb0029b0b007d26fa6299ceb92d14a0a"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.1/arm64-macos-bugsnag-cli"
      sha256 "c48f0117db30d4a2f86c09ec9fc96470fdfb79281290508a8957e38df7196063"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.1/x86_64-linux-bugsnag-cli"
      sha256 "6593a7018916abe4f4c9a86d7ebbcafadb04673253914e80826adcbc2701ca94"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.1/arm64-linux-bugsnag-cli"
      sha256 "2d2f1474a2b6f17a7fc27a81a4eb815f859ffb1f044b6f839fdffe95b0c6c40e"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.1/i386-linux-bugsnag-cli"
      sha256 "52c6c193909f1b37e724d69be025fff433d86f618e9e69142ecaa2de2a96c1bf"
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
