class ApiController < ApplicationController
  def time

  	# Set +0300 time zone
  	Time.zone = "Moscow"
  	# Get standard datetime from service, using HTTParty
  	response = HTTParty.get('http://time.jsontest.com/').as_json
  	# Parse response, using mask
  	standard_time = Time.strptime("#{response["date"]} #{response["time"]} UTC", "%m-%d-%Y %H:%M:%S %P %Z")
  	# Convert stadart datetime to current timezone
  	moscow_time = standard_time.in_time_zone
  	# Format datetime to required
  	formatted_time = moscow_time.strftime("%Y-%m-%d %H:%M:%S")

  	render json: {:datetime => formatted_time}.to_json
	
  end
end
