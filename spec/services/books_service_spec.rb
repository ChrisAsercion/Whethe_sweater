# require 'rails_helper'

# describe BooksService do
#   context "class_methods" do
#     context "#books_by_query_and_quantity" do
#       it "returns book data" do

#         query = Books.new("denver, co", 8)

#         books = BooksService.new.books_by_query_and_quantity(query)
        
#         expect(books).to be_a Hash
#         expect(books[:numFound]).to be_a Integer

#         #These are the books
#         expect(books[:docs]).to be_a Array

#         books[:docs].each do |book|
#           #all books should roughly include the query params (some title cut out CO)
#           expect(book[:title].downcase).to include("denver")
#           expect(book[:isbn]).to be_a(Array).or be_nil
#         end
#       end
#     end
#   end
# end