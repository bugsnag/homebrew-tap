class BugsnagDsymUpload < Formula
  desc "Commands for uploading files to Bugsnag via the upload APIs"
  homepage "https://docs.bugsnag.com/api/dsym-upload"
  url "https://github.com/bugsnag/bugsnag-dsym-upload/archive/v2.1.0.tar.gz"
  sha256 "5fd8d640f91c6644ffdc90b7b5cc87070386799e6272d87e41b13f39dda75f68"
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
