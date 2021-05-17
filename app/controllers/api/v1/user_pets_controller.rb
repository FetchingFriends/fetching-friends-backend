class Api::V1::UserPetsController < ApplicationController
  def index
    begin
      user_pets = User.user_pets(user_id)
      render json: PetSerializer.new(user_pets)
    rescue ActiveRecord::RecordNotFound
      render json: {error: "No such user", status: 404}, status: 404
    end
  end

  private

  def user_id
    params.permit(:user_id)[:user_id]
  end
end
