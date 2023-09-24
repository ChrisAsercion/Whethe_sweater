class ForecastFacade
  def initialize(query)
    @query = query
  end

  def get_data
    service = ForecastService.new

    json = service.forecast_by_query(@query)
  end
end