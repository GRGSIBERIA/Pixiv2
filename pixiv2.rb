require "openssl"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

require "mechanize"
require "./lib/error.rb"
require "./lib/login.rb"
require "./lib/agent.rb"