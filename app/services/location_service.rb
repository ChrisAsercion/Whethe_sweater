class LocationService
  def location_by_query(query)
    response = conn(query).get("/geocoding/v1/address")
    
    JSON.parse(response.body, symbolize_names: true)
    #require 'pry'; binding.pry
  end

  def conn(query)
      Faraday.new(url: 'https://www.mapquestapi.com'
    ) do |faraday|
      faraday.params["key"] = Rails.application.credentials.map_quest_api[:map_key]
      faraday.params["location"] = query
    end
  end
  
end