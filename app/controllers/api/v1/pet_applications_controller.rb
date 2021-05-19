class Api::V1::PetApplicationsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
  rescue_from ArgumentError, with: :render_invalid_status
  before_action :validate_params, only: :create

  def create
    application = Application.new(application_params)
    if application.save
      render json: ApplicationSerializer.new(application), status: :created
    else
      render json: { error: application.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def update
      app = Application.find(params[:id])
      app.status = params[:status]
      app.save!
      render json: ApplicationSerializer.new(app), status: :ok
  end

  private

  def application_params
    params.permit(:user_id, :pet_id, :description)
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

  def render_invalid_status(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
