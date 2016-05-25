
class DockingStation
  attr_accessor :bike
  # def initialize
  #   @bike = Bike.new
  # end
  def release_bike
    raise "No Bikes" if !(@bike)
    return @bike

  end

  def dock(bike)
    @bike = bike
  end
  # replaced by attr_accessor
  # def bike
  #   @bike
  # end
end
