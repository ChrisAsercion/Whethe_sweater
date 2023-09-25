class BooksFacade
  def initialize(query, quantity)
    @query = query
    @quantity = quantity
  end

  def get_data
    service = BooksService.new
    books = Books.new(@query, @quantity)
    json = service.books_by_query_and_quantity(books)
  end
end