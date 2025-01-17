require 'openssl'
require 'rackup/handler/webrick'
require 'webrick'
require 'webrick/https'

require File.join(File.dirname(__FILE__), 'basic')

key_file = File.join(File.dirname(__FILE__), '..', 'data', '127.0.0.1.cert.key')
cert_file = File.join(File.dirname(__FILE__), '..', 'data', '127.0.0.1.cert.crt')
Rackup::Handler::WEBrick.run(Basic,
  :Port             => 9443,
  :SSLEnable        => true,
  :SSLPrivateKey    => OpenSSL::PKey::RSA.new(File.open(key_file).read),
  :SSLCertificate   => OpenSSL::X509::Certificate.new(File.open(cert_file).read),
  :SSLCACertificateFile => cert_file,
  :SSLVerifyClient  => OpenSSL::SSL::VERIFY_NONE,
)
