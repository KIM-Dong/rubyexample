require 'forecast_io'


ForecastIO.configure do |configuration|
  configuration.api_key = '8b73d729cbebcd1334a61fd5cbd962b7'
end

forecast = ForecastIO.forecast(37.8267, -122.423)

puts forecast