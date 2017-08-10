# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Clfft < Formula
  desc "a software library containing FFT functions written in OpenCL"
  homepage "https://github.com/clMathLibraries/clFFT"
  url "https://github.com/clMathLibraries/clFFT/archive/v2.12.2.tar.gz"
  sha256 "e7348c146ad48c6a3e6997b7702202ad3ee3b5df99edf7ef00bbacc21e897b12"

  depends_on "cmake" => :build

  def install
    system "cmake", "src", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test clFFT`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
