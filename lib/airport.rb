require_relative 'weather'

class Airport

  include Weather

  attr_reader :hangar
  attr_reader :capacity

  def hangar
    @hangar ||= []
  end

  def capacity
    @capacity = 6
  end 

  def allow_take_off
    if check_sunny_weather? == true
      hangar.each { |plane| taxi_to_runway(plane) }
    else
      p "the airplane/airplanes cannot take off in bad weather"
    end
  end

  def allow_landing(plane)
    if check_sunny_weather? == true
      taxi_to_stop(plane)
    else
      p "the airplane cannot land in bad weather"
    end
  end

   def taxi_to_runway(plane) 
    if plane.flying? == false
      take_off(plane)
    end
  end

  def taxi_to_stop(plane)
    if plane.flying? == true
      landing(plane)
    end
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