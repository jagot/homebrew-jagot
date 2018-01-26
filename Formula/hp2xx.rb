# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

require 'fileutils'

class Hp2xx < Formula
  desc "Converts HPGL Plotter language to other vector & raster graphics formats."
  homepage "https://www.gnu.org/software/hp2xx/"
  url "https://ftpmirror.gnu.org/hp2xx/hp2xx-3.4.4.tar.gz"
  sha256 "47b72fb386a189b52f07e31e424c038954c4e0ce405803841bed742bab488817"

  depends_on "zlib"
  depends_on "libpng"
  depends_on :x11

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "sed", "-i", "bak", "s:prefix   = /usr/local:prefix   = #{prefix}:g", "sources/Makefile"
    system "sed", "-i", "bak", "s:#include <png.h>:#include <zlib.h>\\
#include <png.h>:g", "sources/png.c"
    system "sed", "-i", "bak", "s:setjmp(png_ptr->jmpbuf):setjmp(png_jmpbuf(png_ptr)):g", "sources/png.c"
    system "cp", "sources/png.c", "/tmp/png.c"
    ["man/man1","bin","info"].each do |d|
      FileUtils.mkdir_p "#{prefix}/#{d}"
    end
    chdir("sources") do 
      system "make"
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end
  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hp2xx`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
