class Api::V1::PetsController < ApplicationController
  def create
    pet = Pet.create(pet_params)
    if pet.save
      render json: PetSerializer.new(pet), status: :created
    end
  end

  private

  def pet_params
    params.permit(:user_id, :name, :age, :animal_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3)
  end
end
