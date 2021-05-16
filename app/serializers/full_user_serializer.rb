class FullUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :pets, :favorites, :applications, :pet_applications
end
