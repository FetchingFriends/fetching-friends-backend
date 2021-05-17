require 'rails_helper'

RSpec.describe "api/v1/applications", type: :request do
  before :each do
    seed_test_db
  end

  describe "Happy path" do
    it "returns a application object if all required information is provided" do
      application_params = { user_id: @users.first.id,
                             pet_id: @users.last.pets.last.id,
                             description: "I'd be good because..."
                           }
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pet_applications', headers: headers, params: application_params.to_json

      new_application = Application.last
      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")
      expect(body.keys).to eq([:data])
      expect(body[:data].keys).to eq([:id, :type, :attributes])
      expect(body[:data][:id]).to eq("#{new_application.id}")
      expect(body[:data][:type]).to eq("application")
      expect(body[:data][:attributes]).to be_a(Hash)
      expect(body[:data][:attributes]).to be_a(Hash)
      expect(body[:data][:attributes].keys).to eq([:user_id, :pet_id, :status, :description])
      expect(body[:data][:attributes][:user_id]).to eq(@users.first.id)
      expect(body[:data][:attributes][:pet_id]).to eq(@users.last.pets.last.id)
      expect(body[:data][:attributes][:status]).to eq("pending")
      expect(body[:data][:attributes][:description]).to eq("I'd be good because...")
    end
  end

  describe "Sad Path and Edge Case" do
    it "returns an error if all required information is not provided" do
      application_params = { pet_id: @users.last.pets.last.id,
                             description: "I'd be good because..."
                           }
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pet_applications', headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(body).to eq({error: "User must exist"})
    end

    it "returns an error if all required information is not provided" do
      application_params = { user_id: @users.first.id,
                             description: "I'd be good because..."
                           }
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pet_applications', headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(body).to eq({error: "Pet must exist"})
    end

    it "returns an error if all required information is not provided" do
      application_params = { user_id: @users.first.id,
                             pet_id: @users.last.pets.last.id
                           }
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pet_applications', headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(body).to eq({error: "Description can't be blank"})
    end

    it "returns an error if an application has alread been made by that user for a given pet" do
      application_params = { user_id: @users.first.id,
                             pet_id: @users.second.pets.first.id,
                             description: "I'd be good because..."
                           }
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pet_applications', headers: headers, params: application_params.to_json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(body).to eq({error: "Application already exists"})
    end
  end
end
