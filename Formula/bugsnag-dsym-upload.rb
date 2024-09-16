class BugsnagDsymUpload < Formula
  desc "Commands for uploading files to Bugsnag via the upload APIs"
  homepage "https://docs.bugsnag.com/api/dsym-upload"
  url "https://github.com/bugsnag/bugsnag-dsym-upload/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "503f1a8aa93ccc32af25e3122ea97630002332f5c79bff3405f39632f9095f6f"
  license "MIT"
  head "https://github.com/bugsnag/bugsnag-dsym-upload"

  def install
    system "make", "BINDIR=#{bin}", "MANDIR=#{man}", "install"
  end

  test do
    system bin/"bugsnag-dsym-upload", "--help"
  end
end
