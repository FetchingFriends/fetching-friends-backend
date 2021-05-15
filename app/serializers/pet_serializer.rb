class PetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3
end
