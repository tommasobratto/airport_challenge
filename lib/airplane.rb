class Airplane

	def initialize
		flying!
	end

	def flying?
		@flying
	end

	def flying!
		@flying = true
	end

	def taxing!
		@flying = false
	end
end