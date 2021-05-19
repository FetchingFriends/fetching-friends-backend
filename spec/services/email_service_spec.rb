require 'rails_helper'

RSpec.describe EmailService, type: :request do

  before :each do
    seed_test_db
  end

  describe "Class Methods" do
    describe ".send_email" do
      it "make an api call to YS Microservice when called" do
        VCR.use_cassette('send_email') do
          to = "doug.welchons@gmail.com"
          from = "someone@domain.com"
          subject = "A new email!"
          content = "a new email has been created"
          response = EmailService.send_email(to, from, subject, content)
          body = JSON.parse(response.body, symbolize_names: true)
          expect(response.status).to eq(202)
          expect(body[:message]).to eq("Message sent successfully")
        end
      end
    end

    describe ".new_application" do
      it "make an api call to YS Microservice when called" do
        VCR.use_cassette('new_application_email') do
          response = EmailService.new_application(@users.first.applications.first.id)
          body = JSON.parse(response.body, symbolize_names: true)
          expect(response.status).to eq(202)
          expect(body[:message]).to eq("Message sent successfully")
        end
      end
    end

    describe ".Approved_application" do
      it "make an api call to YS Microservice when called" do
        VCR.use_cassette('approved_application_email') do
          response = EmailService.update_application(@users.first.applications.first.id, "approved")
          body = JSON.parse(response.body, symbolize_names: true)
          expect(response.status).to eq(202)
          expect(body[:message]).to eq("Message sent successfully")
        end
      end
    end
  end
end
