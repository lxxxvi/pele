module Types
  class UserParams < BaseInputObject
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
