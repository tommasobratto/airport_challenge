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

	def take_off(plane)
		raise 'Hangar is empty' if empty?
		plane.flying!
		hangar.delete(plane)
	end

	def landing(plane)
		raise 'Hangar is full' if full?
		plane.taxing!
		hangar << plane
	end

	def taxi_to_stop(plane)
		if plane.flying? == true
			landing(plane)
		end
	end

	def taxi_to_runway(plane)	
		if plane.flying? == false
			take_off(plane)
		end
	end

	def allow_take_off(plane)
		if sunny_weather? == true
			hangar.each { |plane| taxi_to_runway(plane) }
		else 
			raise 'the airplane cannot take off in bad weather'
		end
	end

	def allow_landing(plane)
		if sunny_weather? == true
			taxi_to_stop(plane)
		else
			raise 'the airplane cannot land in bad weather'
		end
	end

	def full?
		hangar.count == capacity
	end

	def empty?
    hangar.count == 0
  end
end