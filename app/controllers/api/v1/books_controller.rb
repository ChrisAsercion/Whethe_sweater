class Api::V1::BooksController < ApplicationController
  def show

    location = params[:location]
    facade = LocationFacade.new(location)
    location_data = facade.mapquest_location

    forecast = ForecastFacade.new(location_data)

    location_forecast = forecast.get_data
    
    quantity = params[:quantity]
    book_facade = BooksFacade.new(location, quantity)
    books_data = book_facade.get_data
    
    render json: BooksSerializer.format_books_and_forecast(location_forecast, books_data)
  end
end