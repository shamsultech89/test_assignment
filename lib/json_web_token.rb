# frozen_string_literal: true

class JsonWebToken
  HMAC_SECRET = 'my$ecretK3y'

  def self.encode_token(user)
    expiration_time = 24.hours.from_now.to_i
    exp_payload = { user_id: user.id, exp: expiration_time }

    token = JWT.encode exp_payload, HMAC_SECRET, 'HS256'
    [token, expiration_time]
  end

  def self.decoded_token(auth_header)
    return unless auth_header

    # header: { 'Authorization': 'Bearer <token>' }
    begin
      JWT.decode auth_header, HMAC_SECRET, true, { algorithm: 'HS256' }
    rescue JWT::ExpiredSignature
      # Handle expired token, e.g. logout user or deny access
      nil
    rescue JWT::DecodeError
      nil
    end
  end
end
