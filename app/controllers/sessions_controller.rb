# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      token, expiration_time = JsonWebToken.encode_token(user)
      render json: { user: user, token: token, expires_in: expiration_time }
    else
      render json: { error: 'Invalid username or password' }
    end
  end
end
