require 'formula'

class Riemann < Formula
  homepage 'http://riemann.io'
  url 'http://aphyr.com/riemann/riemann-0.2.4.tar.bz2'
  sha1 '465965eb1c82f65872b85e685c44111a9af9f794'
  
  version '0.2.4-boxen1'

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
