class BugsnagDsymUpload < Formula
  desc "Commands for uploading files to Bugsnag via the upload APIs"
  homepage "https://docs.bugsnag.com/api/dsym-upload"
  url "https://github.com/bugsnag/bugsnag-dsym-upload/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "f3b063a023be5db21807ba6bacbc2999f904db046ad267b888d23e4ee0adf165"
  license "MIT"
  head "https://github.com/bugsnag/bugsnag-dsym-upload"

  def install
    system "make", "BINDIR=#{bin}", "MANDIR=#{man}", "install"
  end

  test do
    system bin/"bugsnag-dsym-upload", "--help"
  end
end
