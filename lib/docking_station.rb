require_relative 'bike'

class DockingStation
  attr_reader :bikes

  CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'Bikes Unavailable' if empty?
    @bikes.pop
  end

  def dock bike
    raise 'Station Full' if full?
    @bikes << bike
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= CAPACITY
  end
end