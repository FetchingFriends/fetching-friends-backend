require "rails_helper"

RSpec.describe "api/v1/pet_applications", type: :request do
  before :each do
    seed_test_db
  end

  describe "Happy path" do
    it "returns the updated application when a status is provided" do
      VCR.use_cassette "update_application" do
        application = @users.first.applications.first
        application_params = {status: "interested"}
        headers = {"CONTENT_TYPE" => "application/json",
                   "ACCEPT"       => "application/json"}

        expect(application.status).to eq("pending")

        put "/api/v1/pet_applications/#{application.id}", headers: headers, params: application_params.to_json

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json")
        expect(body.keys).to eq([:data])
        expect(body[:data]).to be_a(Hash)
        expect(body[:data].keys).to eq([:id, :type, :attributes])
        expect(body[:data][:id]).to eq("#{application.id}")
        expect(body[:data][:type]).to eq("application")
        expect(body[:data][:attributes]).to be_a(Hash)
        expect(body[:data][:attributes].keys).to eq([:user_id, :pet_id, :status, :description])
        expect(body[:data][:attributes][:user_id]).to eq(@users.first.id)
        expect(body[:data][:attributes][:pet_id]).to eq(@users.second.pets.first.id)
        expect(body[:data][:attributes][:status]).to eq("interested")
        expect(body[:data][:attributes][:description]).to eq("I want it!")
      end
    end
  end

  describe "Sad Path and Edge Case" do
    it "returns an error when no status is provided" do
      application = @users.first.applications.first
      application_params = {}
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      expect(application.status).to eq("pending")

      put "/api/v1/pet_applications/#{application.id}", headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(body).to eq({error: "Validation failed: Status can't be blank"})
    end

    it "returns an error if an invalid status is provided" do
      application = @users.first.applications.first
      application_params = {status: "approved"}
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      put "/api/v1/pet_applications/#{application.id}", headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(body).to eq({error: "'approved' is not a valid status"})
    end

    it "returns an error if the applications does not exist" do
      application = @users.first.applications.first
      application_params = {status: "interested"}
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      expect(application.status).to eq("pending")

      put "/api/v1/pet_applications/1", headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(body).to eq({error: "Couldn't find Application with 'id'=1"})
    end
  end
end
