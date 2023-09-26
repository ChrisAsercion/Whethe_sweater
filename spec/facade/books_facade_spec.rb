'rails_helper'

describe BooksFacade do
  let(:query) { 'Ruby Programming' }
  let(:quantity) { 10 }
  
  describe '#get_data' do
    it 'calls BooksService with the provided query and quantity' do

      books_facade = BooksFacade.new(query, quantity)

      json = books_facade.get_data


      expect(json[:numFound]).to be_a Integer
      expect(json[:docs]).to be_a Array
      json[:docs].each do |book|
        expect(book[:isbn]).to be_a(Array).or be_nil
        
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
      end
    end
  end
end
