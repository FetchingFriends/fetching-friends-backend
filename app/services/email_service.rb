class EmailService

  def self.new_application(application_id)
    application = Application.find(application_id)
    to = application.pet.user.email
    from = application.user.email
    subject = "Someone wants to adopt your pet!"
    content = "Someone wants to adopt your pet!\n You can view you dashboard here: <need FE web address>"

    send_email(to, from, subject, content)
  end

  def self.update_application(application_id, status)
    application = Application.find(application_id)
    to = application.user.email
    from = application.pet.user.email
    subject = "You're request to adoped a pet has been updated."
    content = "You're request to adoped a pet has been updated.\n You can view you dashboard here: <need FE web address>"

    send_email(to, from, subject, content)
  end

  def self.send_email(to, from, subject, content)
    connection.post('/api/v1/mail') do |req|
      req.headers["CONTENT_TYPE"] = "application/json"
      req.params = {to: to, from: from, subject: subject, content: content}
    end
  end

  def self.connection
    Faraday.new(url: ENV['EMAIL_MICROSERVICE'])
  end
end
