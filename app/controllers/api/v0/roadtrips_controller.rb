class Api::V0::RoadtripsController < ApplicationController
  before_action :authenticate_api_key, only: :show

  def show
    
    origin = params[:origin]
    destination = params[:destination]
    
    facade = LocationFacade.new(destination)
    location_data = facade.mapquest_location

    forecast = ForecastFacade.new(location_data)

    location_forecast = forecast.get_data

    route_facade = RouteFacade.new(origin, destination)
    route_data =  route_facade.get_route
    
    #this could be refactored into an iteration incase of other errors that might occur
    if route_data[:info][:messages][0] == "We are unable to route with the given locations."
      hour_forecast = {
        time: "",
        temp_f: "",
        condition: {
          text: ""
        }

      }
      travel_time = "Impossible"
      
      render json: RouteSerializer.format_route_and_weather(hour_forecast, travel_time, origin, destination)
      return
    end
    current_time = Time.now
    travel_time = route_data[:route][:formattedTime] 
    hours, minutes, seconds = travel_time.split(':').map(&:to_i)
    arrival_time = current_time + hours.hours + minutes.minutes + seconds.seconds

    rounded_arrival_time = arrival_time.beginning_of_hour
    formatted_arrival_time = rounded_arrival_time.strftime("%Y-%m-%d %H:%M")

    #Finding the time for the specific day

    hour_forecast = nil 

    location_forecast[:forecast][:forecastday].find do |hour|
      hour_forecast = hour[:hour].find do |time|
        time[:time] == formatted_arrival_time
      end
    end

    render json: RouteSerializer.format_route_and_weather(hour_forecast, travel_time, origin, destination)
  end


  private

  def authenticate_api_key
    api_key = params[:api_key]

    # This is a hardcoded api key for mock purposes
    if api_key.nil? || api_key != "t1h2i3s4_i5s6_l7e8g9i10t11"
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end