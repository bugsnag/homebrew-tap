class BugsnagDsymUpload < Formula
  desc "Commands for uploading files to Bugsnag via the upload APIs"
  homepage "https://docs.bugsnag.com/api/dsym-upload"
  url "https://github.com/bugsnag/bugsnag-dsym-upload/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "bf6517b0d437adc167bc42b97376b46f41f7773ac0faaa9ed8697ce0082a5277"
  license "MIT"
  head "https://github.com/bugsnag/bugsnag-dsym-upload"
  bottle :unneeded

  def install
    system "make", "BINDIR=#{bin}", "MANDIR=#{man}", "install"
  end

  test do
    system bin/"bugsnag-dsym-upload", "--help"
  end
end
