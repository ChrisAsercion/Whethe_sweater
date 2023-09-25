class Books
  attr_reader :query, :quantity

  def initialize(query, quantity)
    @query = query
    @quantity = quantity
  end
end