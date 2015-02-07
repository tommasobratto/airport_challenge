require 'airport'
require 'airplane'

# Notice: The rspec file contains no working tests because most of the testing was done in 'irb'.
# The code works (at least for the tests I listed in 'test.rb'),
# but I still need to add the necessary rspec tests.

describe Airport do
	
	let(:airport) 			 { Airport.new 									 																}
	let(:taxing_plane)   { double :plane, flying?: false, flying!: true, taxing!: false }
	let(:flying_plane)   { double :plane, flying?: true, taxing!: false, flying!: true  }

	context 'take off and landing procedures' do

		it 'should allow planes to land' do
		
		end

		it 'should allow planes to take off' do

	 	end
	end	
end