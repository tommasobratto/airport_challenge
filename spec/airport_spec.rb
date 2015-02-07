require 'airport'

describe Airport do

	let (:airport) { Airport.new }
	let (:good_weather) { double :weather, sunny: true, stormy: false, is_good?: true}
	let (:bad_weather)  { double :weather, stormy: true, sunny: false, is_good?: false}
	let (:flying_airplane)     { double :airplane, flying!: true, flying?: true}
	let (:taxing_airplane)     { double :airplane, taxing!: true, flying?: false}

	context "control tower" do

		it "should check for weather" do # this isn't working
			good_weather.is_good?
			airport.check_for_good_weather(good_weather)
			expect(airport.safe_conditions?).to eq true
		end

		it "should check for a plane's flying status" do
			flying_airplane.flying?
			expect(airport.radio_call_plane(flying_airplane)).to be true
		end

	end

	context "take off and landing procedures" do

		it "should allow planes to take off in sunny weather" do
			good_weather.is_good?
			taxing_airplane.flying?
			airport.store(taxing_airplane)
			airport.check_for_good_weather(good_weather)
			airport.radio_call_plane(taxing_airplane)
			airport.allow_take_off(taxing_airplane)
			expect(airport.hangar.count).to eq(0)
		end

		it "should allow planes to land in sunny wheater" do

		end

		it "should not allow planes to take off in stormy weather" do
	
		end

		it "should not allow planes to land in stormy weather" do

  	end
  end
end