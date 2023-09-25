class DummyService
  def _by_query(query)
    response = conn(query).get("search.json")

    JSON.parse(response.body, symbolize_names: true)

  end

  def conn(query)
    Faraday.new(url: 'https://openlibrary.org/') do |faraday|
      faraday.params["key"] = Rails.application.credentials.weather_api[:weather_key]
      faraday.params["q"] = "Denver, CO"
      faraday.params["limit"] = 5
    end
  end
end