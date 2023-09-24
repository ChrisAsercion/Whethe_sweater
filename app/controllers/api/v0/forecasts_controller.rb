class Api::V0::ForecastsController < ApplicationController
  def show
    location = params[:location]
    facade = LocationFacade.new(location)
    location_data = facade.mapquest_location
    

    forecast = ForecastFacade.new(location_data)

    forecast.get_data
    render json: 
  end
end