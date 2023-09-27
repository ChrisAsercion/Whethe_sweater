# require 'rails_helper'

# describe 'API::V1::Books API' do
#   it 'Finds a quantity of books about a certain location' do
#     location = 'denver, CO'
#     quantity = 5

#     get '/api/v1/book-search', params: { location: location, quantity: quantity  }, headers: {
#       'ACCEPT' => 'application/json',
#       'CONTENT_TYPE' => 'application/json'
#     }

#     book_forecast = JSON.parse(response.body, symbolize_names: true)

#     expect(response).to have_http_status(:success)

#     expect(book_forecast[:data][:id]).to eq("null")
#     expect(book_forecast[:data][:type]).to eq("books")

#     #attributes
#     expect(book_forecast[:data][:attributes][:destination]).to eq("Denver, Co")
#     expect(book_forecast[:data][:attributes]).to have_key(:total_books_found)
#     expect(book_forecast[:data][:attributes][:total_books_found]).to be_a(Integer)
    
    
#     expect(book_forecast[:data][:attributes][:forecast]).to be_a(Hash)
#     expect(book_forecast[:data][:attributes][:forecast]).to have_key(:summary)
#     expect(book_forecast[:data][:attributes][:forecast][:summary]).to be_a(String)
#     expect(book_forecast[:data][:attributes][:forecast]).to have_key(:temperature)
#     expect(book_forecast[:data][:attributes][:forecast][:temperature]).to be_a(String)
    
#     book_forecast[:data][:attributes][:books].each do |book|
#       expect(book).to have_key(:isbn)
#       expect(book[:isbn]).to be_a(Array).or be_nil
      
#       expect(book).to have_key(:title)
#       expect(book[:title]).to be_a(String)
#     end

  
#   end
# end