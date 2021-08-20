class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email
  has_many :activities
end
