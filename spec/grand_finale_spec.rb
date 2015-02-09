require './lib/airport.rb'
require './lib/airplane.rb'

describe "The Grand Finale" do

  let(:airport)         { Airport.new  }
  let(:spitfire)        { Airplane.new }
  let(:mustang)         { Airplane.new }
  let(:gobbo_maledetto) { Airplane.new }
  let(:zeke)            { Airplane.new }
  let(:bf109)           { Airplane.new }
  let(:sturmovik)       { Airplane.new }

  before do
    allow(airport).to receive(:random_weather) { 2 }
  end

  it "should make 6 planes land and take off without issues, checking for their status" do
    puts "checking for good weather..."
    
    expect(airport.sunny_weather?).to eq(true)
    
    puts "the airplanes are allowed to land"
    
    airport.allow_landing(spitfire)
    airport.allow_landing(mustang)
    airport.allow_landing(gobbo_maledetto)
    airport.allow_landing(zeke)
    airport.allow_landing(bf109)
    airport.allow_landing(sturmovik)

    puts "the airplanes are checked for their status"

    expect(spitfire.flying?).to eq(false)
    expect(mustang.flying?).to eq(false)
    expect(gobbo_maledetto.flying?).to eq(false)
    expect(zeke.flying?).to eq(false)
    expect(bf109.flying?).to eq(false)
    expect(sturmovik.flying?).to eq(false)

    puts "the airplanes are allowed to take off"

    airport.allow_take_off(spitfire)
    airport.allow_take_off(mustang)
    airport.allow_take_off(gobbo_maledetto)
    airport.allow_take_off(zeke)
    airport.allow_take_off(bf109)
    airport.allow_take_off(sturmovik)

    puts "the airplanes are checked for their status while airborne"

    expect(spitfire.flying?).to eq(true)
    expect(mustang.flying?).to eq(true)
    expect(gobbo_maledetto.flying?).to eq(true)
    expect(zeke.flying?).to eq(true)
    expect(bf109.flying?).to eq(true)
    expect(sturmovik.flying?).to eq(true)
  
  end
end