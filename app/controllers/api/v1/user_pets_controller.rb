class Api::V1::UserPetsController < ApplicationController
  def index
    begin
      @pets = User.find(user_id).pets
    rescue ActiveRecord::RecordNotFound
      render json: {error: "No such user", status: 404}, status: 404
    end
  end

  private

  def user_id
    params[:id]
  end
end
