module Types
  class UserType < BaseObject
    field :email, String, null: false
    field :password, String, null: false
  end
end
