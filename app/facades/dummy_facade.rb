class DummyFacade
  def initialize(query)
    @query = query
  end

  def get_data
    service = DummyService.new

    json = service._by_query(@query)
  end
end