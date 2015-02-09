require 'airport' 

describe Airport do 
  
  let(:airport)        { Airport.new                                                  }
  let(:taxing_plane)   { double :plane, flying?: false, flying!: true, taxing!: false }
  let(:flying_plane)   { double :plane, flying?: true, taxing!: false, flying!: true  }

  context 'weather control' do

    it 'should be able to return sunny weather' do
      expect(airport).to receive(:random_weather) { 2 }
      airport.weather_forecast
      expect(airport.check_sunny_weather?).to eq(true)
    end

    it 'should be able to return stormy weather' do
      expect(airport).to receive(:random_weather) { 3 }
      airport.weather_forecast
      expect(airport.check_sunny_weather?).to eq(false)
    end
  end

  context 'control tower' do

    def fill_airport(airport)
      airport.capacity.times { airport.landing(flying_plane) } # 'landing' method only used for testing here
    end

    it 'should expect to be full' do
      fill_airport airport
      expect(airport.full?).to be true
    end

    it 'should raise an error when the hangar is full and a plane tries to land' do
      fill_airport airport
      expect(airport).to receive(:random_weather) { 2 }
      airport.weather_forecast
      expect{ airport.allow_landing(flying_plane) }.to raise_error( 'Hangar is full' )
    end   
  end

  context 'take off and landing procedures' do

    it 'should allow planes to land in sunny conditions' do
      flying_plane.flying!
      expect(airport).to receive(:random_weather) { 2 }
      airport.weather_forecast
      airport.allow_landing(flying_plane)
      expect(airport.hangar).to eq([flying_plane])
    end

    it 'should allow planes to take off in sunny conditions' do
      taxing_plane.taxing!
      expect(airport).to receive(:random_weather) { 2 }
      airport.weather_forecast
      airport.allow_take_off
      expect(airport.hangar).to eq([])
    end

    it 'should not allow planes to land in stormy conditions' do
      flying_plane.flying!
      expect(airport).to receive(:random_weather) { 3 }
      airport.weather_forecast
      expect(airport.allow_landing(flying_plane)).to eq( 'the airplane cannot land in bad weather' )
    end

    it 'should not allow planes to take off in stormy conditions' do
      taxing_plane.taxing!
      expect(airport).to receive(:random_weather) { 3 }
      airport.weather_forecast
      expect(airport.allow_take_off).to eq( 'the airplane/airplanes cannot take off in bad weather' )
    end
  end 
end