class FullUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email
end
