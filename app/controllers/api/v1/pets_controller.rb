class Api::V1::PetsController < ApplicationController
  before_action :validate_params

  def create
    pet = Pet.create(pet_params)
    if pet.save
      render json: PetSerializer.new(pet), status: :created
    else
      render json: { error: pet.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def pet_params
    params.permit(:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3)
  end

  def validate_params
    render json: { error: 'Must provide request body' }, status: :bad_request if request.body.read.blank?
  end
end
