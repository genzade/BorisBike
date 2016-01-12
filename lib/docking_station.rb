require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :broken_bikes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise 'Bike Unavailable' if empty? || bike_is_broken?
    bikes.pop
  end

  def dock bike
    raise 'Station Full' if full?
    bike.broken? ? broken_bikes << bike : bikes << bike
  end

  def collect_broken
    collected = broken_bikes.map{|bike| bike}
    @broken_bikes.clear
    return collected
  end

  private
  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count + broken_bikes.count >= capacity
  end

  def bike_is_broken?
    bikes.last.broken? == true
  end
end


# def collect_broken_bikes
#     give_bikes = broken_bikes.map{|bike| bike}
#     @broken_bikes.clear
#     return give_bikes
#   end