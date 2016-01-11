class Van
  def initialize
    @bikes = []
  end

  def collect_bikes_from(station)
    @bikes << station.broken_bikes
  end
end