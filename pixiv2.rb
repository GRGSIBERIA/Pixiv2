require "openssl"

def DisableCertificate
  OpenSSL::SSL.module_eval{ remove_const(:VERIFY_PEER) }
  OpenSSL::SSL.const_set( :VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE )
  puts "Warning: Certificate has not been issued. Don't worry :)"
end

DisableCertificate