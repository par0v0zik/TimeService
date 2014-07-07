class ApiController < ApplicationController

	def timezones
		# Get all timezones sorted by name
		zones = ActiveSupport::TimeZone.all.map{|r| r.name}.sort
		if params[:letter] # If searched by first letter
			if params[:letter].length == 1
				render json: {:timezones => zones.select{|z| z[0] == params[:letter].upcase}}
			else
				render json: {:error => "Timezone could be searched only by first letter (ex. A or a)!"}
			end
		else # Send all timezones
			render json: {:timezones => zones}
		end
	end	

  	def time

  		timezone = params[:timezone] || "Moscow"
	  	# Set given timezone or Moscow as default
	  	Time.zone = timezone.downcase.titleize
	  	# Get standard datetime from service, using HTTParty
	  	response = HTTParty.get('http://time.jsontest.com/').as_json
	  	# Parse response, using mask
	  	standard_time = Time.strptime("#{response["date"]} #{response["time"]} UTC", "%m-%d-%Y %H:%M:%S %P %Z")
	  	# Convert stadart datetime to current timezone
	  	moscow_time = standard_time.in_time_zone
	  	# Format datetime to required
	  	formatted_time = moscow_time.strftime("%Y-%m-%d %H:%M:%S")
	  	render json: {:datetime => formatted_time}

	rescue ArgumentError
		render json: {:error => "Invalid timezone!"}
  	end
end
