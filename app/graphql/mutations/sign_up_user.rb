module Mutations
  class SignUpUser < BaseMutation
    argument :user_params, Types::UserParams, required: true

    field :email, String, null: true
    field :errors, [Types::UserError], null: false

    def resolve(user_params: nil)
      user = User.new(user_params.to_h)
      user.save

      {
        email: user.email,
        errors: build_errors(user)
      }
    end

    private

    def build_errors(object)
      object.errors.map do |attribute, message|
        {
          attribute: attribute.to_s.camelize(:lower),
          message: message
        }
      end
    end
  end
end
