class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.0/x86_64-macos-bugsnag-cli"
      sha256 "0fcbd6394867cfb64e50942de1a4272664af04828d5144f03003a3c71d73ba70"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.0/arm64-macos-bugsnag-cli"
      sha256 "c57d29a607544df5c8961c99a5b7d536a607bd32f975d24caaaa224e72834bd7"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.0/x86_64-linux-bugsnag-cli"
      sha256 "15cff99c7b24ee5891ba6c8efe7913d18c7d9c5f4f15a0df0cf341cf3a851c5d"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.0/arm64-linux-bugsnag-cli"
      sha256 "0e375586132954606e94e5b3c5d466ad54f26519cf2a9d1bbf4dad38ce734636"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.10.0/i386-linux-bugsnag-cli"
      sha256 "c52840f3aaea39b3f4aede5f45b5bb5348eec3eeaa77f3155f8a067a8cb5f91c"
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
