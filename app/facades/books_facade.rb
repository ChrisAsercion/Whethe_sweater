class BooksFacade
  def initialize(query, quantity)
    @query = query
    @quantity = quantity
  end

  def get_data
    service = BooksService.new

    json = service.books_by_query_and_quantity(@query, @quantity)
  end
end