class NewAppEmailJob < ApplicationJob
  queue_as :default

  def perform(application)
    EmailService.new_application(application.id)
  end
end
