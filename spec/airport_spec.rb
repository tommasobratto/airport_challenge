require 'airport'
require 'airplane'

# Notice: The rspec file contains no working tests because most of the testing was done in 'irb'.
# The code works (at least for the tests I listed in 'test.rb'),
# but I still need to add the necessary rspec tests.

describe Airport do
	
	let(:airport) 			 { Airport.new 									 																}
	let(:taxing_plane)   { double :plane, flying?: false, flying!: true, taxing!: false }
	let(:flying_plane)   { double :plane, flying?: true, taxing!: false, flying!: true  }

	context 'control tower' do

    it 'should be able to check if an airplane is flying' do

    end

    it 'should be able to check if the weather is sunny' do

    end
  end

  context 'take off and landing procedures' do

		it 'should allow planes to land in sunny conditions' do
			
		end

		it 'should allow planes to take off in sunny conditions' do

	 	end

	 	it 'should not allow planes to land in stormy conditions' do

	 	end

	 	it 'should not allow planes to take off in stormy conditions' do

	 	end
	end	

	context 'airplane status'

		it 'can be flying' do

		end

		it 'can be taxing' do

		end
	end
end