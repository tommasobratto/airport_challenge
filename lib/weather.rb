module Weather

  def initialize
    random_weather
    check_weather?
  end

  def sunny
    @sunny_weather = true
  end

  def stormy
    @sunny_weather = false
  end

  def check_weather?
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