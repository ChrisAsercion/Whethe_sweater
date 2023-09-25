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

      expect(response).to have_http_status(:success)
    end
  end
end