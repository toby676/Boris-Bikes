
class DockingStation
  attr_accessor :bike
  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end
  # replaced by attr_accessor
  # def bike
  #   @bike
  # end
end
