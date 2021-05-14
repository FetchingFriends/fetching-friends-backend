class Api::V1::UsersController < ApplicationController
  before_action :validate_params

  def create
    user = User.create!(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: { error: user.errors.full_messages.to_sentance }, status: :bad_request
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
