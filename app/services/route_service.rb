class RouteService
  def route_finder(query)
    response = conn(query).get("/directions/v2/route")
    
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(query)
      Faraday.new(url: 'https://www.mapquestapi.com'
    ) do |faraday|
      faraday.params["key"] = Rails.application.credentials.map_quest_api[:map_key]
      faraday.params["to"] = query.to
      faraday.params["from"] = query.from
    end
  end
  
end