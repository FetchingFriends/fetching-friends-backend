class UserFacade

  def self.get_all_user_data(email)
    if email == nil
      return OpenStruct.new(error: "email required")
    else
      user = User.find_by(email: email)
      return OpenStruct.new(error: "invalid email") if user.nil?

      pet_applications = user.pets.map do |pet|
        pet.applications
      end.flatten

      favorite_pets = user.favorites.map do |favorite|
        favorite.pet
      end

      OpenStruct.new(
                      id: user.id,
                      username: user.username,
                      email: user.email,
                      pets: pet_list(user.pets),
                      applications: user.applications,
                      favorites: pet_list(favorite_pets),
                      pet_applications: pet_applications
                    )
    end

  end

  def self.pet_list(pets)
    pets.map do |pet|
      {id: pet.id, type: "pet", attributes: {user_id: pet.user_id, name: pet.name, age: pet.age, pet_type: pet.pet_type, breed: pet.breed, description:pet.description, gender: pet.gender, fixed: pet.fixed, house_trained: pet.house_trained, photo_url_1: pet.photo_url_1, photo_url_2: pet.photo_url_2, photo_url_3: pet.photo_url_3, good_with_kids: pet.good_with_kids, good_with_animals: pet.good_with_animals, created_at: pet.created_at, updated_at: pet.updated_at}}
    end
  end
end
