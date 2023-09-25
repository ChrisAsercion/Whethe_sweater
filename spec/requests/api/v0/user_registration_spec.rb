require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Post User" do
    it "creates a User from a request", :vcr do
      user_request = {
        email: "example@gmail.com",
        password: "password123",
        password_confirmation: "password123"
      }

      post api_v0_users_path, params: user_request.to_json, headers: { 'Content-Type' => 'application/json',
      'Accept' => 'application/json' }

      new_user = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)

      expect(new_user[:data][:type]).to eq("users")
      expect(new_user[:data]).to have_key(:id)
      expect(new_user[:data][:id]).to be_a Integer

      #attributes
      expect(new_user[:data][:attributes]).to have_key(:email)
      expect(new_user[:data][:attributes][:email]).to be_a String

      expect(new_user[:data][:attributes]).to have_key(:api_key)
      expect(new_user[:data][:attributes][:api_key]).to be_a String

    end

    #sad path
    it "returns an error if the user if user creation unsuccessful" do
      user_request = {
        email: "example@gmail.com",
        password: "password123",
        password_confirmation: "password321"
      }

      post api_v0_users_path, params: user_request.to_json, headers: { 'Content-Type' => 'application/json',
      'Accept' => 'application/json' }
      
      failed_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(422)
      expect(failed_user[:errors][0]).to eq("Password confirmation doesn't match Password")
    end
  end
end