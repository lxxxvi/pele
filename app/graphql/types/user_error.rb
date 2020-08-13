module Types
  class UserError < BaseObject
    description 'Handled errors for Mutations::CreateUser'

    field :message, String, null: false, description: 'Error message'
    field :attribute, String, null: true, description: 'Affected attribute'
  end
end
