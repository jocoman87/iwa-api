class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    currentUser = User.find_by(email: auth_params[:email])
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(
      auth_token: auth_token, 
      current_user: {
        name: currentUser.name,
        email: currentUser.email,
        role: currentUser.role
      }
    )
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end