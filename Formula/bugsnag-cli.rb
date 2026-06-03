class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.2/x86_64-macos-bugsnag-cli"
      sha256 "7a18e142c4b24d03ab08fa722d8b10d21d66aac4bcfc911307329773b55d5240"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.2/arm64-macos-bugsnag-cli"
      sha256 "d9dcb7edd6841b40d1d5bed99aefb18e7b18ab46e4b840255ee4e69b3e275dc1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.2/x86_64-linux-bugsnag-cli"
      sha256 "a4979943f0238469b88f6eb65879eca02ebdf682247e079ce07fa0c944b6d8ac"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.2/arm64-linux-bugsnag-cli"
      sha256 "3353d749c63f2da06b39ded1086f74065700d3ee243a66c6a85601df9949b677"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.2/i386-linux-bugsnag-cli"
      sha256 "04bd97673c81571914429065918f887f0299f48300c8e5639d5aacce6385c243"
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
