class BugsnagDsymUpload < Formula
  desc "Commands for uploading files to Bugsnag via the upload APIs"
  homepage "https://docs.bugsnag.com/api/dsym-upload"
  url "https://github.com/bugsnag/bugsnag-dsym-upload/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "5f2a9170cbd82720e4cb91bda74bed8665f0cdae98c6f4290846bd5d89e04e3d"
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
