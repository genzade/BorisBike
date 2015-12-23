require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise 'Bikes Unavailable' unless @bike
    @bike
  end

  def dock bike
    raise 'Station Full' if @bike
    @bike = bike
  end
end