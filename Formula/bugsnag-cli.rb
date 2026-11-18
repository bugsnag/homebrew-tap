class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.7/x86_64-macos-bugsnag-cli"
      sha256 "88acbf3cc4e1b69ee88417ffeca87fa665d9c74f36a457c0ecf4a84be7c2197f"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.7/arm64-macos-bugsnag-cli"
      sha256 "4b9ac73d411cb36feb85ff6db71b136124f60b2cd7352a678581f79629ca2b4e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.7/x86_64-linux-bugsnag-cli"
      sha256 "149ac7ef90edc1e9afd508addfba15ef78007a31ddd103dfd291f6cf4049ef0c"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.7/arm64-linux-bugsnag-cli"
      sha256 "7721b5eef1a72a7425f0a40f66052cca5e67324e6ff9191a91a59a08d1c43556"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.7/i386-linux-bugsnag-cli"
      sha256 "b0c60cc488aaeec2f4d1f6c8c6e59c2f88f4c895a00a962f985c229f7d023423"
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
