module RequestRailsHelper

  def seed_test_db
    @users = create_list(:user, 2)

    @users.each do |user|
      (5).times do
        create(:pet, user: user)
      end
    end

    @users.first.applications.create!(pet: @users.second.pets.first, description: "I want it!")
    @users.first.applications.create!(pet: @users.second.pets.second, description: "I want it!")
    @users.second.applications.create!(pet: @users.first.pets.second, description: "I want it!")
    @users.second.applications.create!(pet: @users.first.pets.first, description: "I want it!")

    @users.first.favorites.create!(pet: @users.second.pets.first)
    @users.first.favorites.create!(pet: @users.second.pets.last)
    @users.second.favorites.create!(pet: @users.first.pets.first)
    @users.second.favorites.create!(pet: @users.first.pets.last)
  end
end
