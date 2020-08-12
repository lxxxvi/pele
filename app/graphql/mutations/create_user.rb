module Mutations
  class CreateUser < BaseMutation
    argument :user_credentials, Types::UserCredentialsInput, required: false

    type Types::UserType

    def resolve(user_credentials: nil)
      User.create(
        email: user_credentials[:email],
        password: user_credentials[:password]
      )
    end
  end
end
