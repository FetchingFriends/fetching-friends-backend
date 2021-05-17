class Api::V1::PetApplicationsController < ApplicationController
  before_action :validate_params, only: :create

  def create
    application = Application.new(application_params)
    if application.save
      render json: ApplicationSerializer.new(application), status: :created
    else
      render json: { error: application.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def application_params
    params.permit(:user_id, :pet_id, :description)
  end

  def validate_params
    render json: { error: 'Must provide request body' }, status: :bad_request if request.body.read.blank?
  end
end
