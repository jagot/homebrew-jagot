require 'fileutils'

class Ft232rProg < Formula
  desc "A command-line interface for reconfiguring the FT232R chip, eliminating the need for FTDI's MProg/FTProg (MS-Windows) packages."
  homepage "http://www.rtr.ca/ft232r/"
  url "http://www.rtr.ca/ft232r/ft232r_prog-1.25.tar.gz"
  sha256 "31dde0188c23b7b8ea684ce29f11ef8f6ddd4c2899dd189786bd171b6616e4ee"

  depends_on "libftdi0"
  depends_on "libusb-compat"

  def install
    system "make"
    FileUtils::mkdir_p "#{prefix}/bin"
    FileUtils::cp "ft232r_prog", "#{bin}"
  end

  test do
    system "#{bin}/ft232r_prog", "--help"
  end
end
