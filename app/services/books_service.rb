class BooksService
  def books_by_query_and_quantity(query, quantity)
    response = conn(query, quantity).get("search.json")
    
    JSON.parse(response.body, symbolize_names: true)

  end

  def conn(query, quantity)
    Faraday.new(url: 'https://openlibrary.org/') do |faraday|
      faraday.params["q"] = query
      faraday.params["quanity"] = quantity
    end
  end
end