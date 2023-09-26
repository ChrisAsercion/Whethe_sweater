'rails_helper'

describe 'RouteFacade' do
  let(:origin) { "Cincinatti,OH" }
  let(:destination) { "Chicago,IL" }

  describe '#get_data' do
    it 'calls BooksService with the provided query and quantity' do
      require 'pry'; binding.pry
      #route_facade = RouteFacade.new(origin, destination)
      require 'pry'; binding.pry
      #forecast = route_facade.get_data


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
end
