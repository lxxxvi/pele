module Mutations
  class SignInUser < BaseMutation
    argument :user_params, Types::UserParams, required: true

    field :user, Types::User, null: true
    field :token, String, null: true
    field :errors, [String], null: false

    def resolve(user_params: nil)
      user = User.find_by(email: user_params[:email])

      return authentication_error unless successfully_authenticated?(user, user_params[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      { user: user, token: token, errors: [] }
    end

    private

    def successfully_authenticated?(user, password)
      user.present? && user.authenticate(password)
    end

    def authentication_error
      { errors: ['Invalid username and/or password'] }
    end
  end
end
