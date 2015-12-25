require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'Bike Unavailable' if empty? || bikes.last.broken? == true
    bikes.pop
  end

  def dock bike
    raise 'Station Full' if full?
    bikes << bike
  end

  private
  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end