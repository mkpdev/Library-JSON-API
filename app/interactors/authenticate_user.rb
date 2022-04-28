class AuthenticateUser
  include Interactor

  def call
    user = User.find_by_email(context.email)

    if user&.authenticate(context.password)
      context.user = user
      context.token = JsonWebToken.encode(user_id: user.id)
      context.time = Time.now + 24.hours.to_i
    else
      context.fail!(message: "authenticate_user.failure")
    end
  end
end
