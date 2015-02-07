class Airplane

	def flying!
		@flying = true
	end

	def flying?
		@flying
	end

	def taxing!
		@flying = false
	end
end