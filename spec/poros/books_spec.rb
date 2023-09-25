require "rails_helper"

RSpec.describe Books do
  it "exists" do 

    books = Books.new("denver, co", 8)

    expect(books).to be_a Books

    expect(books.quantity).to be_a Integer
    expect(books.quantity).to eq(8)

    expect(books.query).to be_a String
    expect(books.query).to eq("denver, co")


  end
end