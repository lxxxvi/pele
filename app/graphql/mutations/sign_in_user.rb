module Mutations
  class SignInUser < BaseMutation
    argument :user_credentials, Types::UserCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(user_credentials: nil)
      return unless user_credentials.present?

      user = User.find_by(email: user_credentials[:email])

      return unless user.present?
      return unless user.authenticate(user_credentials[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      { user: user, token: token }
    end
  end
end
