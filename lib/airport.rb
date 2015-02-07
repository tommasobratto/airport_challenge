require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 6

	def hangar
		@hangar ||= []
	end

	def capacity=(value)
		@capacity = value
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end
	
	def store(plane)
		hangar << plane
	end

	def release(plane)
		hangar.delete(plane)
	end

	def take_off(plane)
		plane.flying!
	end

	def landing(plane)
		plane.taxing!
	end

	def taxi_to_stop(plane)
		if plane.flying? == true
			landing(plane)
			store(plane)
		end
	end

	def taxi_to_runway(plane)	
		if plane.flying? == false
			take_off(plane)
			release(plane)
		end
	end

	def allow_take_off(plane)
		hangar.each do |plane|
			if sunny_weather? == true
				taxi_to_runway(plane)
			end
		end
	end

	def allow_landing(plane)
		if sunny_weather? == true
			taxi_to_stop(plane)
		end
	end
end