require_relative 'weather'

class Airport

  include Weather

  attr_reader :hangar, :capacity

  def hangar
    @hangar ||= []
  end

  def capacity
    @capacity = 6
  end 

  def allow_take_off(plane)
    if sunny_weather? == true
      taxi_to_runway(plane)
    else
      p "the airplane/airplanes cannot take off in bad weather"
    end
  end

  def allow_landing(plane)
    if sunny_weather? == true
      taxi_to_stop(plane)
    else
      p "the airplane cannot land in bad weather"
    end
  end

  def taxi_to_runway(plane) 
    take_off(plane) if plane.flying? == false
  end

  def taxi_to_stop(plane)
    landing(plane) if plane.flying? == true
  end

  def take_off(plane)
    plane.flying!
    hangar.delete(plane)
  end

  def landing(plane)
    raise 'Hangar is full' if full?
    plane.taxing!
    hangar << plane
  end

  def full?
    hangar.count == capacity
  end
end