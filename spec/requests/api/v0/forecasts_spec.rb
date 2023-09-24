require 'rails_helper'

describe 'API::V0::Forecasts API' do
  it 'returns forecast data for a location' do
    location = 'cincinnati, oh'

    get '/api/v0/forecast', params: { location: location }, headers: {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json'
    }

    response_data = JSON.parse(response.body, symbolize_names: true)

    
    expect(response).to have_http_status(:success)
    expect(response_data[:query]).to eq('Cincinnati')
    expect(response_data[:lat]).to eq(39.10713)
    expect(response_data[:lon]).to eq(-84.50413)
  end
end