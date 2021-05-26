class Api::V1::PetApplicationsController < ApplicationController
  before_action :validate_params, only: :create

  def create
    application = Application.new(application_params)
    application.pet_name = Pet.find(application.pet_id).name
    if application.save
      # EmailService.new_application(application.id)
      NewAppEmailJob.perform_later(application)
      render json: ApplicationSerializer.new(application), status: :created
    else
      render json: { error: application.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def update
      application = Application.find(params[:id])
      application.status = params[:status]
      if application.save!
        # EmailService.update_application(application.id, application.status) unless application.pending?
        UpdateAppEmailJob.perform_later(application)
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
end
