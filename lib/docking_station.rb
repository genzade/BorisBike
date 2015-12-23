require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise 'Bikes Unavailable' unless @bike
    @bike
  end

  def dock bike
    @bike = bike
  end
end