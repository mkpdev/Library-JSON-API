class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    result = AuthenticateUser.call(params)

    if result.success?
      render json: { token: result.token, exp: result.time.strftime("%m-%d-%Y %H:%M"),
                     username: result.user.username }, status: :ok
    else
      render json: { error: result.message }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
