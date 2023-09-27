require 'rails_helper'

describe 'API::V0::Routes API' do
  it 'returns the weather data upon arrival of destination', vcr:{ cassette_name: 'oh_il'} do
    VCR.use_cassette('oh_il') do
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
  
  
  it 'does ny to la', vcr:{ cassette_name: 'ny_la'} do
    VCR.use_cassette('la_ny') do
      road_trip = {
          origin: "New York,NY",
          destination: "Los Angeles,CA",
          api_key: "t1h2i3s4_i5s6_l7e8g9i10t11"
        }

        post '/api/v0/road_trip', params: road_trip.to_json, headers: {
          'ACCEPT' => 'application/json',
          'CONTENT_TYPE' => 'application/json'
        }

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast[:data][:id]).to eq("null")
      expect(forecast[:data][:type]).to eq("road_trip")

        #attributes
      expect(forecast[:data][:attributes]).to be_a(Hash)
        
      expect(forecast[:data][:attributes]).to have_key(:start_city)
      expect(forecast[:data][:attributes][:start_city]).to be_a(String)
      expect(forecast[:data][:attributes][:start_city]).to eq(road_trip[:origin])
    end
  end

  it 'does ny to Panama City, Panama', vcr:{ cassette_name: 'ny_pc'}  do
    VCR.use_cassette('ny_pc') do
      road_trip = {
        origin: "New York,NY",
        destination: "Panama City,Panama",
        api_key: "t1h2i3s4_i5s6_l7e8g9i10t11"
      }

      post '/api/v0/road_trip', params: road_trip.to_json, headers: {
        'ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
      }

      forecast = JSON.parse(response.body, symbolize_names: true)
      
      expect(forecast[:data][:id]).to eq("null")
      expect(forecast[:data][:type]).to eq("road_trip")

      #attributes
      expect(forecast[:data][:attributes]).to be_a(Hash)
      
      expect(forecast[:data][:attributes]).to have_key(:start_city)
      expect(forecast[:data][:attributes][:start_city]).to be_a(String)
      expect(forecast[:data][:attributes][:start_city]).to eq(road_trip[:origin])
    end
  end

  it 'does not do ny to London, UK', vcr:{ cassette_name: 'ny_uk'} do
    VCR.use_cassette('ny_uk') do
      road_trip = {
        origin: "New York,NY",
        destination: "London,UK",
        api_key: "t1h2i3s4_i5s6_l7e8g9i10t11"
      }

      post '/api/v0/road_trip', params: road_trip.to_json, headers: {
        'ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
      }

      forecast = JSON.parse(response.body, symbolize_names: true)
      
      expect(forecast[:data][:id]).to eq("null")
      expect(forecast[:data][:type]).to eq("road_trip")

      #attributes
      expect(forecast[:data][:attributes]).to be_a(Hash)
      
      expect(forecast[:data][:attributes]).to have_key(:start_city)
      expect(forecast[:data][:attributes][:start_city]).to be_a(String)
      expect(forecast[:data][:attributes][:start_city]).to eq(road_trip[:origin])
      expect(forecast[:data][:attributes][:travel_time]).to eq("Impossible")
      expect(forecast[:data][:attributes][:weather_at_eta][:datetime]).to eq("")
      expect(forecast[:data][:attributes][:weather_at_eta][:condition]).to eq("")
    end
  end

  it 'returns 401 Unauthorized when an invalid API key is provided', vcr:{ cassette_name: 'unauthorized'}  do
    VCR.use_cassette('unauthorized') do
      road_trip = {
        origin: "Cincinnati,OH",
        destination: "Chicago,IL",
        api_key: "invalid_api_key"
      }
    
      post '/api/v0/road_trip', params: road_trip.to_json, headers: {
        'ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
      }
    
      expect(response).to have_http_status(:unauthorized)
    end
  end
  
  it 'returns 401 Unauthorized when no API key is provided', vcr:{ cassette_name: 'unauthorized'} do
    VCR.use_cassette('unauthorized') do
      road_trip = {
        origin: "Cincinnati,OH",
        destination: "Chicago,IL"
        # No api_key provided
      }
    
      post '/api/v0/road_trip', params: road_trip.to_json, headers: {
        'ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
      }
    
      expect(response).to have_http_status(:unauthorized)
    end
  end
end