module Weather

	def initialize
		sunny
	end

	def is_good?
		@good_weather
	end

	def sunny
		@good_weather = true 
	end

	def stormy
		@good_weather = false
	end

	def random_weather_generator
		if 1 + rand(1..3) == 3
			stormy
		else
			sunny 
		end
	end
end