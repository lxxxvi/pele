module Mutations
  class SignInUser < BaseMutation
    argument :user_params, Types::UserParams, required: false

    field :token, String, null: true
    field :user, Types::User, null: true

    def resolve(user_params: nil)
      return unless user_params.present?

      user = User.find_by(email: user_params[:email])

      return unless user.present?
      return unless user.authenticate(user_params[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      { user: user, token: token }
    end
  end
end
