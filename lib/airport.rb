require_relative 'weather'

class Airport

  include Weather

  attr_reader :capacity
  attr_reader :hangar

  def capacity
    @capacity = 6
  end 

  def hangar
    @hangar ||= []
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

  def taxi_to_stop(plane)
    if plane.flying? == true
      landing(plane)
    end
  end

  def taxi_to_runway(plane) 
    if plane.flying? == false
      take_off(plane)
    end
  end

  def allow_take_off
    if sunny_weather? == true
      hangar.each { |plane| taxi_to_runway(plane) }
    else 
      raise 'the airplane cannot take off in bad weather'
    end
  end

  def allow_landing(plane)
    if sunny_weather? == true
      taxi_to_stop(plane)
    else
      raise 'the airplane cannot land in bad weather'
    end
  end

  def full?
    hangar.count == capacity
  end
end