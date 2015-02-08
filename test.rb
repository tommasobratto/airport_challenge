require './lib/airport.rb'
require './lib/airplane.rb'

# tests on 'irb':
#
# airport = Airport.new
# airplane = Airplane.new
#
# - airport.sunny_weather? # initialized as 'true'
# - airplane.flying? # initialized as 'true'
#
# - airport.allow_landing(airplane)
# - airport.hangar # checks to see if the airplane is in the array 'hangar'
# - airplane.flying? # checks if the airplane now stored in the array returns 'false' if method 'flying?' is passed
#
# - airport.allow_take_off
# - airport.hangar # it should now return an empty array
# - airplane.flying? # it should now return 'true'
#
# - airport.stormy
# - airport.sunny_weather? # it should return 'false'
# - airport.allow_landing(airplane) # returns 'nil'
# - airplane.flying? # still returns true
# 
# - airport.sunny
# - airplane.taxing! # this method used only for testing
# - airport.take_off(plane) # this method also used only for testing
# - airport.hangar # returns airplane with '@flying' instance variable returning 'false' in the array 'hangar'
# - airport.allow_take_off # returns an empty array
# - airplane.flying? # returns 'true'
# 
# - airport.stormy
# - airplane.flying? # initialized as 'true'
# - airport.allow_landing(airplane) # returns 'nil'
# - airplane.flying? # still returns 'true'
#
# - airport.random_weather_generator # gives a randomly selected different value ('true' or 'false') for the variable '@sunny_weather'
#
# - NOTE: the method airport.take_off acts funny when the array contains more than one Airplane class object. It only "allows take off" 
#         for a plane every two-three planes in the array. I'm impressed.
#