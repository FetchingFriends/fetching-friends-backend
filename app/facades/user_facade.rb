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
                      pets: user.pets,
                      applications: user.applications,
                      favorites: favorite_pets,
                      pet_applications: pet_applications
                    )
    end
  end
end
