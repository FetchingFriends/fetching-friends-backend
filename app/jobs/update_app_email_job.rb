class UpdateAppEmailJob < ApplicationJob
  queue_as :default

  def perform(application)
    EmailService.update_application(application.id, application.status) unless application.pending?
  end
end
