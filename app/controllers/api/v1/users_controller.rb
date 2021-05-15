class Api::V1::UsersController < ApplicationController
  before_action :validate_params, only: [:create]

  def index
    user = User.find_by(email: params[:email])
    # user_data = UserSerializer.new(user)
    # pets_data = PetSerializer.new(user.pets)
    # applications_data = ApplicationSerializer.new(user.applications)

    pet_applications = user.pets.map do |pet|
      pet.applications
    end.flatten

    favorite_pets = user.favorites.map do |favorite|
      favorite.pet
    end

    user_object = OpenStruct.new(id: user.id, username: user.username, email: user.email, pets: user.pets, applications: user.applications, favorites: favorite_pets, pet_applications: pet_applications)

    # pet_applications_data = ApplicationSerializer.new(pet_applications)
    # render json: {data: {id: nil, type: "full_user_details", user: user_data, pets: pets_data, applications: applications_data, pet_applications: pet_applications_data}}, status: :ok
    render json: FullUserSerializer.new(user_object), status: :ok
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:username, :email)
  end

  def validate_params
    render json: { error: 'Must provide request body' }, status: :bad_request if request.body.read.blank?
  end
end
