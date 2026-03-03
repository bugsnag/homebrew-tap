class BugsnagCli < Formula
  desc "CLI for uploading symbol files and creating releases on your BugSnag dashboard"
  homepage "https://docs.bugsnag.com/build-integrations/bugsnag-cli/"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.8.0/x86_64-macos-bugsnag-cli"
      sha256 "f1388c0ffc63ed357218a77e00d29a17fa29ccd10173e19aaddf172d922d7393"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.8.0/arm64-macos-bugsnag-cli"
      sha256 "7f30b7266a6552fa5d0fb4a42e810c815626d3e6baaff4bfb093cdf0dd60eb2a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.8.0/x86_64-linux-bugsnag-cli"
      sha256 "88c717ecbd4163abdc829036fed1084ccef5c0a0c94bd6b3f893d5f40a4dff80"
    elsif Hardware::CPU.arm?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.8.0/arm64-linux-bugsnag-cli"
      sha256 "d6ba038c4dc5cff64b4085b38657d2c1255bbd4cf3044be6aec81b70182bc8ba"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/bugsnag/bugsnag-cli/\1v3.8.0/i386-linux-bugsnag-cli"
      sha256 "901f296702c7600be7dd8a089be221f3af353734e7f59b10b3c40ddcf8aa06e5"
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
