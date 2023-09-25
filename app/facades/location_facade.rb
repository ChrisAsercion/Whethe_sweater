class LocationFacade
  def initialize(query)
    @query = query
  end

  def mapquest_location
    service = LocationService.new

    json = service.location_by_query(@query)
    
    location = json[:results][0][:locations][0]
    Location.new(location) 
  end
end