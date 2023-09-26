class Api::V0::RoadtripsController < ApplicationController
  def show
    
    origin = params[:origin]
    destination = params[:destination]
    
    facade = LocationFacade.new(destination)
    location_data = facade.mapquest_location

    forecast = ForecastFacade.new(location_data)

    location_forecast = forecast.get_data

    route_facade = RouteFacade.new(origin, destination)
    route_data =  route_facade.get_route
    

    current_time = Time.now
    travel_time = route_data[:route][:formattedTime] 
    hours, minutes, seconds = travel_time.split(':').map(&:to_i)
    arrival_time = current_time + hours.hours + minutes.minutes + seconds.seconds

    rounded_arrival_time = arrival_time.beginning_of_hour
    formatted_arrival_time = rounded_arrival_time.strftime("%Y-%m-%d %H:%M")

    hour_forecast = location_forecast[:forecast][:forecastday][0][:hour].find do |hour|
      hour[:time] == formatted_arrival_time
    end
    
    render json: RouteSerializer.format_route_and_weather(hour_forecast, travel_time, origin, destination)
  end
end