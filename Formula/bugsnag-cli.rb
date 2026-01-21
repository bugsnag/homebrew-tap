class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.7.0/x86_64-macos-bugsnag-cli"
      sha256 "ff9f9526f0bddce99d6bc1a39059ea1a113ac430412640aa748d93eb82eca81b"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.7.0/arm64-macos-bugsnag-cli"
      sha256 "56dde319d488efbafb1fe216435cc474b635f8b776a49c930ccfa024b28c762c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.7.0/x86_64-linux-bugsnag-cli"
      sha256 "eb987fb7ade186f91694e12adf00c0a4442359dc3462a93fef2e9bf4334f8801"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.7.0/arm64-linux-bugsnag-cli"
      sha256 "b47bc8b94c9a22974a278ceab1d5924a10c5a02703dc5da0bd114a2dae38235c"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.7.0/i386-linux-bugsnag-cli"
      sha256 "fd5d60b0e4f078058a8f6bb3d3d574609add4987abeb4ce17382fac097451def"
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
