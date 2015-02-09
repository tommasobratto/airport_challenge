require './lib/airport.rb'
require './lib/airplane.rb'

describe "The Grand Finale" do

  it "should make 6 planes land and take off without issues, checking for their status" do
    airport = Airport.new

    spitfire = Airplane.new
    mustang = Airplane.new
    gobbo_maledetto = Airplane.new
    zeke = Airplane.new
    bf109 = Airplane.new
    sturmovik = Airplane.new

    expect(airport).to receive(:random_weather) { 2 }
    airport.weather_forecast
    expect(airport.check_sunny_weather?).to eq(true)
    
    airport.allow_landing(spitfire)
    airport.allow_landing(mustang)
    airport.allow_landing(gobbo_maledetto)
    airport.allow_landing(zeke)
    airport.allow_landing(bf109)
    airport.allow_landing(sturmovik)

    expect(spitfire.flying?).to eq(false)
    expect(mustang.flying?).to eq(false)
    expect(gobbo_maledetto.flying?).to eq(false)
    expect(zeke.flying?).to eq(false)
    expect(bf109.flying?).to eq(false)
    expect(sturmovik.flying?).to eq(false)

    expect(airport).to receive(:random_weather) { 2 }
    airport.weather_forecast
    expect(airport.check_sunny_weather?).to eq(true)
    airport.allow_take_off
    
    expect(spitfire.flying?).to eq(true)
    expect(mustang.flying?).to eq(true)
    expect(gobbo_maledetto.flying?).to eq(true)
    expect(zeke.flying?).to eq(true)
    expect(bf109.flying?).to eq(true)
    expect(sturmovik.flying?).to eq(true)
    expect(mustang.flying?).to eq(true)

    # The last 'flying?' part fails... there's something weird going on between the 'allow_take_off' and 'hangar' methods... 
   end
end