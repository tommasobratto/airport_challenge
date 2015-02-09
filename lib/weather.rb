module Weather

  def initialize
    weather_forecast
    check_sunny_weather?
  end

  def sunny
    @sunny_weather = true
  end

  def stormy
    @sunny_weather = false
  end

  def check_sunny_weather?
    @sunny_weather
  end

  def weather_forecast
    if random_weather != 3
      sunny
    else
      stormy
    end
  end

  def random_weather
    @random_weather = rand(6)
  end
end