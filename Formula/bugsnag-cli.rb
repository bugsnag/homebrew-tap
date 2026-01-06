class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.0/x86_64-macos-bugsnag-cli"
      sha256 "4c09939e9aefc19508a5224e6b17bb7f7d1baea026b4b17241e76b31b161e933"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.0/arm64-macos-bugsnag-cli"
      sha256 "d096127d9ee34822db9a770b0bcab6428e67fe6f0ebfd34a7de96270c7e33721"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.0/x86_64-linux-bugsnag-cli"
      sha256 "74ba2c6d8ec76ef70b4e842a03c4b190dd304aa24de3c8488a8db26873c63d2c"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.0/arm64-linux-bugsnag-cli"
      sha256 "e0b678b39768182d550cde66e70dc9b7f77715d8c52ac5e24a9a6980674b1531"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/eleases/download/v3.6.0/i386-linux-bugsnag-cli"
      sha256 "9b6a1eab583ef235347bc31f2fb332a6434989ce27e919d2418d56d769357112"
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
