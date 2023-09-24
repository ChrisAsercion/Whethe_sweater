class ForecastService
  def forecast_by_query(query)
    response = conn(query).get("/v1/forecast.json")
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
    #require 'pry'; binding.pry
  end

  def conn(query)
    Faraday.new(url: 'http://api.weatherapi.com') do |faraday|
      require 'pry'; binding.pry
      faraday.params["key"] = Rails.application.credentials.weather_api[:weather_key]
      faraday.params["q"] = query.query
      faraday.params["lat"] = "#{query.lat}" + "," + "#{query.lon}"
      faraday.params["days"] = 5
    end
  end
end