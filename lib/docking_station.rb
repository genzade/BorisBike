require_relative 'bike'

class DockingStation
  attr_reader :bikes

  CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'Bikes Unavailable' if @bikes.empty?
    @bikes.pop
  end

  def dock bike
    raise 'Station Full' if @bikes.count >= CAPACITY
    @bikes << bike
  end
end