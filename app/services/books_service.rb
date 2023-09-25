class BooksService
  def books_by_query_and_quantity(books)
    response = conn(books).get("search.json")
    
    JSON.parse(response.body, symbolize_names: true)

  end

  def conn(books)
    Faraday.new(url: 'https://openlibrary.org/') do |faraday|
      faraday.params["q"] = books.query
      faraday.params["limit"] = books.quantity
    end
  end
end