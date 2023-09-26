require 'rails_helper'

describe 'API::V0::Forecasts API' do
  it 'returns a five day forecast of the coordinates given' do
    road_trip = {
      origin: "Cincinatti,OH",
      destination: "Chicago,IL",
      api_key: "t1h2i3s4_i5s6_l7e8g9i10t11"
    }

    post '/api/v0/road_trip', params: road_trip.to_json, headers: {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json'
    }

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:success)

    expect(forecast[:data][:id]).to eq("null")
    expect(forecast[:data][:type]).to eq("road_trip")

    #attributes
    expect(forecast[:data][:attributes]).to be_a(Hash)
    
    expect(forecast[:data][:attributes]).to have_key(:start_city)
    expect(forecast[:data][:attributes][:start_city]).to be_a(String)
    expect(forecast[:data][:attributes][:start_city]).to eq(road_trip[:origin])

    expect(forecast[:data][:attributes]).to have_key(:end_city)
    expect(forecast[:data][:attributes][:end_city]).to be_a(String)
    expect(forecast[:data][:attributes][:end_city]).to eq(road_trip[:destination])

    expect(forecast[:data][:attributes]).to have_key(:travel_time)
    expect(forecast[:data][:attributes][:travel_time]).to be_a(String)
    
    expect(forecast[:data][:attributes]).to have_key(:weather_at_eta)
    expect(forecast[:data][:attributes][:weather_at_eta]).to be_a(Hash)

    expect(forecast[:data][:attributes][:weather_at_eta]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:weather_at_eta][:datetime]).to be_a(String)

    expect(forecast[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:weather_at_eta][:temperature]).to be_a(String)

    expect(forecast[:data][:attributes][:weather_at_eta]).to have_key(:condition)
    expect(forecast[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)

  end
end