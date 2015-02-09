module Weather

  def initialize
    random_weather
    sunny_weather?
  end

  def sunny_weather?
    if random_weather != 3
      true
    else
      false
    end
  end

  def random_weather
    @random_weather = rand(6)
  end
end