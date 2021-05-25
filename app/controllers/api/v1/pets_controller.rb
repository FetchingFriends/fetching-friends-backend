class Api::V1::PetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
  before_action :validate_params, only: [:create]

  def create
    pet = Pet.create(pet_params)
    if pet.save
      render json: PetSerializer.new(pet), status: :created
    else
      render json: { error: pet.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def index
    pets = Pet.search(pet_type)
    if pets
      render json: PetSerializer.new(pets)
    else
      render json: { error: 'Pet type not recognized' }, status: :bad_request
    end
  end

  def show
    pet = Pet.find(params[:id])
    render json: PetSerializer.new(pet)
  end

  private

  def pet_params
    params.permit(:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3)
  end

  def pet_type
    params.permit(:type)[:type]
  end

  def validate_params
    render json: { error: 'Must provide request body' }, status: :bad_request if request.body.read.blank?
  end

  def render_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_invalid_record(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
