class ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :pet_id, :pet_name, :status, :description
end
