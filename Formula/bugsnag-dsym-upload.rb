class BugsnagDsymUpload < Formula
  desc "Commands for uploading files to Bugsnag via the upload APIs"
  homepage 'https://docs.bugsnag.com/api/dsym-upload'
  url "https://github.com/bugsnag/bugsnag-dsym-upload/archive/v2.0.0.tar.gz"
  head 'https://github.com/bugsnag/bugsnag-dsym-upload'
  sha256 "182e99f49ae6915c61d09cd705d67d304f6cf9f34fe4abb8c0b9668944899b98"
  license "MIT"
  bottle :unneeded

  def install
    system "make", "BINDIR=#{bin}", "MANDIR=#{man}", "install"
  end

  test do
    system bin/"bugsnag-dsym-upload", "--help"
  end
end
