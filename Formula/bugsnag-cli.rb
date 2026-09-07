class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.6/x86_64-macos-bugsnag-cli"
      sha256 "0d8e740d7da102272f10e5936535c277570e38d973d1310524ff0e28ad1a70ac"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.6/arm64-macos-bugsnag-cli"
      sha256 "c8c1289970f2700271fa27677d9de59b235191492fc331c3ce4b61caca5946b1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.6/x86_64-linux-bugsnag-cli"
      sha256 "a94982459576e399a35a19d03370a5d8cd8d61ddbcf58ea64936deb19214b213"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.6/arm64-linux-bugsnag-cli"
      sha256 "04b792e7c1e2d5dff1ae67d39f9ae977e437b6de9d7b360ff06a351a1287cb66"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.6/i386-linux-bugsnag-cli"
      sha256 "e696251335ce705165a917f88014820ca585a60d24a54cfc7231a9d1ad2004c5"
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
