class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :admin
end

