require 'jwt'
require 'digest'

module Auth
  ALG = 'HS256'
  HMAC_SECRET = ENV['HMAC_SECRET']

  def encode_jwt(payload)
    JWT.encode payload, HMAC_SECRET, ALG
  end

  def random_hash
    Digest::MD5.hexdigest (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def decode_jwt(token)
    JWT.decode token, HMAC_SECRET, false, { algorithm: ALG }
  rescue
    nil
  end
end