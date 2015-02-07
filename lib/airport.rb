require_relative 'weather'

class Airport 

	DEFAULT_CAPACITY = 6

	include Weather

	def safe_conditions?
		@safe_conditions
	end

	def flying?
		@flight
	end

	def check_for_good_weather(good_weather)
		if good_weather.is_good? == false
			@safe_conditions = false
		else
			@safe_conditions = true 
		end
	end

	def radio_call_plane(airplane)
		if airplane.flying? == true
			@flight = true
		else
		  @flight = false
		end
	end

	def allow_take_off(plane)
		if safe_conditions? == true && plane.flying? == true
			release(plane)
		else
		end
	end

	def hangar
		@hangar = [] || @hangar = DEFAULT_CAPACITY # still need to setup capacity
	end

	def store(plane)
		hangar << plane
	end

	def release(plane)
		hangar.delete(plane)
	end

	def allow_landing(plane)
		if safe_conditions? == true && plane.flying? == true
			store(plane)
		else
		end
	end 
end