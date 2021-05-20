class ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :pet_id, :status, :description
end
