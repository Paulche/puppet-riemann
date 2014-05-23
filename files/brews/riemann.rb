require 'formula'

class Riemann < Formula
  homepage 'http://riemann.io'
  url 'http://aphyr.com/riemann/riemann-0.2.5.tar.bz2'
  sha1 'b5122eb059b28e1be47812898e6444f80880e0c9'
  
  version '0.2.5-boxen1'

  def install
    bin.install 'bin/riemann'

    lib.install 'lib/riemann.jar'
  end

  def caveats; <<-EOS.undent
    You may also wish to install these Ruby gems:
      riemann-client
      riemann-tools
      riemann-dash
    EOS
  end
end
