class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.4.0/x86_64-macos-bugsnag-cli"
      sha256 "35a545eefd60ab648886934942c1ab77909d9820e814300c6255bb54d36ae1eb"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.4.0/arm64-macos-bugsnag-cli"
      sha256 "f1394ef501e9dc4cc6b3745c7f627b50c04eaf48c8091e0b94d3fa8b324ecae5"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.4.0/x86_64-linux-bugsnag-cli"
      sha256 "e5bf31d8e597155c7085114659c864b763e085a6a04c955189cb76eb1dbbd2f2"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.4.0/arm64-linux-bugsnag-cli"
      sha256 "ed501333a17374dfe834f5c049ba7f4d7f900fe64b0d24104e6cf721a1f9488f"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/releases/download/v3.4.0/i386-linux-bugsnag-cli"
      sha256 "4bb3569f64b4ef632dc0355704447c06d7ee004feb5e1ce565c008f9d3b69d13"
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
