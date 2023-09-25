require 'rails_helper'

describe 'API::V0::Forecasts API' do
  it 'returns a five day forecast of the coordinates given' do
    location = 'Denver, CO'

    get '/api/v0/forecast', params: { location: location }, headers: {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json'
    }

    response_data = JSON.parse(response.body, symbolize_names: true)

    
    expect(response).to have_http_status(:success)
    expect(response_data[:location][:name]).to eq('Denver')
    expect(response_data[:location][:region]).to eq('Colorado')
    expect(response_data[:location][:lat]).to eq(39.74)
    expect(response_data[:location][:lon]).to eq(-104.99)
  end
end