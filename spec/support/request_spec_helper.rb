module RequestRailsHelper

  def seed_test_db
    @users = create_list(:user, 2)
    @users.first.email = "another@email.com"
    @users.second.email = "yet_another@email.com"
    @users.first.save
    @users.second.save

    @users.each do |user|
      (5).times do
        create(:pet, user: user)
      end
    end

    @users.first.applications.create!(pet: @users.second.pets.first, pet_name: @users.second.pets.first.name, description: "I want it!")
    @users.first.applications.create!(pet: @users.second.pets.second, pet_name: @users.second.pets.second.name, description: "I want it!")
    @users.second.applications.create!(pet: @users.first.pets.second, pet_name: @users.first.pets.second.name, description: "I want it!")
    @users.second.applications.create!(pet: @users.first.pets.first, pet_name: @users.first.pets.first.name, description: "I want it!")

    @users.first.favorites.create!(pet: @users.second.pets.first)
    @users.first.favorites.create!(pet: @users.second.pets.last)
    @users.second.favorites.create!(pet: @users.first.pets.first)
    @users.second.favorites.create!(pet: @users.first.pets.last)
  end
end
