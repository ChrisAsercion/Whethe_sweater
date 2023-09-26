require 'rails_helper'

RSpec.describe 'API::V0::Sessions API' do
  describe "Sign in" do
    it "can start a session when a user is in the database" do
      user_create = {
        email: "example@gmail.com",
        password: "password123",
        password_confirmation: "password123"
      }

      post api_v0_users_path, params: user_create.to_json, headers: { 'Content-Type' => 'application/json',
      'Accept' => 'application/json' }

      user_request = {
        email: "example@gmail.com",
        password: "password123",
      }

      post api_v0_sessions_path, params: user_request.to_json, headers: { 'Content-Type' => 'application/json',
      'Accept' => 'application/json' }
      
      signed_in_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(signed_in_user[:data][:type]).to eq("users")
      expect(signed_in_user[:data]).to have_key(:id)
      expect(signed_in_user[:data][:id]).to be_a Integer

      expect(signed_in_user[:data][:attributes]).to have_key(:email)
      expect(signed_in_user[:data][:attributes][:email]).to eq("example@gmail.com")
      

      expect(signed_in_user[:data][:attributes]).to have_key(:api_key)
      expect(signed_in_user[:data][:attributes][:api_key]).to be_a String
    end

    it "Renders Error message if login unsuccessful" do
      user_create = {
        email: "example@gmail.com",
        password: "password123",
        password_confirmation: "password123"
      }

      user_bad_login = {
        email: "example@gmail.com",
        password: "password321",
      }

      post api_v0_users_path, params: user_create.to_json, headers: { 'Content-Type' => 'application/json',
      'Accept' => 'application/json' }
      post api_v0_sessions_path, params: user_bad_login.to_json, headers: { 'Content-Type' => 'application/json',
      'Accept' => 'application/json' }
      
      not_signed_in_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(422)
      expect(not_signed_in_user[:errors]).to eq("Credentials do not match")
    end
  end
end