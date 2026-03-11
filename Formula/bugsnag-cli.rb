class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.9.0/x86_64-macos-bugsnag-cli"
      sha256 "6ffae058c6563d75e5ccf496e3181094ffa9bc8a10c5a504cb490f08701c99d7"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.9.0/arm64-macos-bugsnag-cli"
      sha256 "b6557831b183fe2527546739d1e512092acc7542f9ae834462cdb10ff8d96575"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.9.0/x86_64-linux-bugsnag-cli"
      sha256 "d6c23baf8cde3c39462dae0c1c6358194f1278951de21d16e4b3ff2ebcccb0f7"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.9.0/arm64-linux-bugsnag-cli"
      sha256 "d5acb0f8ced7066bc370c78030a3356958346f1653176b7f6f38bb1caf24e722"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.9.0/i386-linux-bugsnag-cli"
      sha256 "4eb88699a921bf9a81acf7a0ebef2b108d03c6062ef6637a3c8d5f8c8186f0ca"
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
