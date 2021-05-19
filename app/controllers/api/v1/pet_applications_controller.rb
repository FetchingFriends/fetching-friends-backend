class Api::V1::PetApplicationsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
  rescue_from ArgumentError, with: :render_invalid_status
  before_action :validate_params, only: :create

  def create
    application = Application.new(application_params)
    if application.save
      EmailService.new_application(application.id)
      render json: ApplicationSerializer.new(application), status: :created
    else
      render json: { error: application.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def update
      application = Application.find(params[:id])
      application.status = params[:status]
      if application.save!
        EmailService.update_application(application.id, application.status) unless application.pending?
        render json: ApplicationSerializer.new(application), status: :ok
      end
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
