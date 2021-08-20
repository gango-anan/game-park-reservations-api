class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email
end
