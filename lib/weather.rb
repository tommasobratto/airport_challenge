module Weather

  def initialize
    sunny 
  end

  def sunny_weather?
    @sunny_weather
  end

  def sunny
    @sunny_weather = true
  end

  def stormy
    @sunny_weather = false
  end

  def random_weather_generator
    if rand(1..7) == 3 
      stormy
    else  
      sunny
    end
  end
end