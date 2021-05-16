class UserFacade

  def self.get_all_user_data(email)
    user = User.find_by(email: email)

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
                    pets: user.pets,
                    applications: user.applications,
                    favorites: favorite_pets,
                    pet_applications: pet_applications
                  )
  end
end
