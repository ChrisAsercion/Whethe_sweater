class ForecastSerializer
  def self.format_forecast(forecast)
    {
      data: {
        id: "null",
        type: "forecast",
        attributes: {
          current_weather: {
            last_updated: forecast[:current][:last_updated], 
            temperature: forecast[:current][:temp_f],
            feels_like: forecast[:current][:feelslike_f],
            humidity: forecast[:current][:humidity],
            uvi: forecast[:current][:uv],
            visibility: forecast[:current][:vis_miles],
            condition: forecast[:current][:condition][:text],
            icon: forecast[:current][:condition][:icon]
          },
          daily_weather: forecast[:forecast][:forecastday].each do |d|
            {
              date: d[:date],
              sunrise: d[:astro][:sunrise],
              sunset: d[:astro][:sunset],
              max_temp: d[:day][:maxtemp_f],
              min_temp: d[:day][:mintemp_f],
              condition: d[:day][:condition][:text],
              icon: d[:day][:condition][:icon]
            }
          end,
          hourly_weather: forecast[:forecast][:forecastday][0][:hour].each do |h|
            {
              time: h[:time][/\d{2}:\d{2}/],
              temperature: h[:temp_f],
              conditions: h[:condition][:text],
              icon: ho[:condition][:icon]
            }
          end
        }
      }
    }
  end
end