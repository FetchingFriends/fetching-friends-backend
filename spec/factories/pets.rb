FactoryBot.define do
  factory :pet do
    name {Faker::Creature::Dog.name}
    age {[1, 2, 3, 4, 5, 6].sample}
    pet_type {1}
    breed {Faker::Creature::Dog.breed}
    description {"This is a great dog!"}
    gender {Faker::Creature::Dog.gender}
    fixed {[true, false].sample}
    house_trained {[true, false].sample}
    photo_url_1 {"photo_url"}
    photo_url_2 {nil}
    photo_url_3 {nil}
    good_with_kids {[true, false].sample}
    good_with_animals {[true, false].sample}
    user
  end
end
