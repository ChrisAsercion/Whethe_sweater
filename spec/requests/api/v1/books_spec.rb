require 'rails_helper'

describe 'API::V1::Books API' do
  it '' do
    location = 'Denver, CO'
    quantity = 5

    get '/api/v1/book-search', params: { location: location, quantity: quantity  }, headers: {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json'
    }

    forecast = JSON.parse(response.body, symbolize_names: true)
  end
end