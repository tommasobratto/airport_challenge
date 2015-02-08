require 'airport'
require 'airplane'

# Notice: The rspec file contains few working tests because most of the testing was done in 'irb'.
# The code works (at least for the tests I listed in 'test.rb'),
# but I still need to make most of the tests pass.

describe Airport do
  
  let(:airport)        { Airport.new                                                  }
  let(:taxing_plane)   { double :plane, flying?: false, flying!: true, taxing!: false }
  let(:flying_plane)   { double :plane, flying?: true, taxing!: false, flying!: true  }

  context 'control tower' do

    def fill_airport(airport)
      airport.capacity.times { airport.landing(flying_plane) } # 'landing' and 'take_off' methods only used for testing here
    end

    def empty_airport(airport)
      airport.capacity.times { airport.take_off(taxing_plane) }
    end

    it 'should be able to check if the weather is sunny' do
      expect(airport).to receive(:random_weather_generator) { :sunny }
      airport.sunny_weather?
    end

    it 'should expect to be full' do
      fill_airport airport
      expect(airport.full?).to be true
    end

    it 'should expect to be empty' do 
      empty_airport airport
      expect(airport.empty?).to be true
    end

    it 'should raise an error when the hangar is full and a plane tries to land' do
      fill_airport airport
      expect(airport.allow_landing(flying_plane)).to raise_error( 'Hangar is full')
    end

    it 'should raise an error when the hangar is empty and a plane tries to take off' do
      empty_airport airport
      expect(airport.allow_take_off(taxing_plane)).to raise_error( 'Hangar is empty' )
    end 
  end

  context 'take off and landing procedures' do

    it 'should allow planes to land in sunny conditions' do
      flying_plane.flying!
      allow(airport).to receive(:random_weather_generator) { :sunny }
      airport.allow_landing(flying_plane)
      expect(airport.hangar).to eq([flying_plane])
    end

    it 'should allow planes to take off in sunny conditions' do
      taxing_plane.taxing!
      allow(airport).to receive(:random_weather_generator) { :sunny }
      airport.allow_take_off
      expect(airport.hangar).to eq([])
    end

    #raise_error examples failing, still have to get around that (the errors actually show up after all, maybe rspec doesn't like me)

    it 'should not allow planes to land in stormy conditions' do
      allow(airport).to receive(:random_weather_generator) { :stormy }
      flying_plane.flying!
      expect(airport.allow_landing(flying_plane)).to raise_error( 'the airplane cannot land in bad weather' )
    end

    it 'should not allow planes to take off in stormy conditions' do
      allow(airport).to receive(:random_weather_generator) { :stormy }
      taxing_plane.taxing!
      expect(airport.allow_take_off).to raise_error( 'the airplane cannot take off in bad weather' )
    end
  end 
end

describe Airplane do

  let(:airplane) { Airplane.new    }
  let(:airport)  { double :airport }

  context 'airplane status' do

    # It needs a way to change the plane's status in the 'airport.allow-...' methods,
    # or we need to change the plane's behaviour (it's the plane that lands and takes off after all)

    it 'should be flying after take off' do      
      airplane.taxing!
      expect(airport).to receive (:allow_take_off) { airplane.flying! } 
      expect(airplane.flying?).to eq true
    end

    it 'should be taxing after landing' do
      airplane.flying!
      expect(airplane).to receive (:allow_landing) { airplane.taxing! }
      expect(airplane.flying?).to eq false
    end
  end
end