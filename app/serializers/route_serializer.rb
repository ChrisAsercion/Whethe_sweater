class RouteSerializer
  def self.format_route_and_weather(forecast, travel_time, origin, destination)
    {
    "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
            "start_city": origin,
            "end_city": destination,
            "travel_time": travel_time,
            "weather_at_eta": {
                "datetime": forecast[:time],
                "temperature": forecast[:temp_f],
                "condition": forecast[:condition][:text]
            }
        }
    }
}
  end
end