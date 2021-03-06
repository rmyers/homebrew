require 'formula'

def build_32bit?; ARGV.include? '--32-bit' or Hardware.is_32_bit?; end

class P7zip < Formula
  url 'http://downloads.sourceforge.net/project/p7zip/p7zip/9.20.1/p7zip_9.20.1_src_all.tar.bz2'
  homepage 'http://p7zip.sourceforge.net/'
  md5 'bd6caaea567dc0d995c990c5cc883c89'

  def options
    [["--32-bit", "Force 32-bit."]]
  end

  def install
    if build_32bit?
      mv 'makefile.SUNOSx_32bits', 'makefile.machine'
    else
      mv 'makefile.SUNOSx_64bits', 'makefile.machine'
    end

    system "make all3"
    system "make", "DEST_HOME=#{prefix}", "DEST_MAN=#{man}", "install"
  end
end
