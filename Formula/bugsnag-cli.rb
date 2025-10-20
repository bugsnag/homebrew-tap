class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.4.1/x86_64-macos-bugsnag-cli"
      sha256 "d6a1b2fc2ae0332b46b2c3ccdf0dd5304b6fcf6a96bda5e78447c73f9246b1eb"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.4.1/arm64-macos-bugsnag-cli"
      sha256 "72f37afe5a72eeaebc7c1460d16f09e79614b1eab01a8c0738840d392fe1f31e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.4.1/x86_64-linux-bugsnag-cli"
      sha256 "1c51a8b0bee311368d0e06b99ab1211c34a552173b21a3e0ada70cf4c2651eb6"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.4.1/arm64-linux-bugsnag-cli"
      sha256 "1063e1d0e4d67dc592c729f66532e2c121173233438884a18c7b4f8fa4071157"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.4.1/i386-linux-bugsnag-cli"
      sha256 "cb92b28161e0cf129efdf7405892842403a5a0c806828ce4b99e5ac581e6e81e"
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
