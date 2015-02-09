module Weather

  def initialize
    random_weather
    sunny_weather?
  end

  def sunny
    @sunny_weather = true
  end

  def stormy
    @sunny_weather = false
  end

  def sunny_weather?
    if random_weather != 3
      sunny
    else
      stormy
    end
  end

  def random_weather
    rand(5)
  end
end