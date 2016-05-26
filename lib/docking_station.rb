class DockingStation
  attr_accessor :bike
  def initialize
    @bike = []
  end

  def release_bike
    raise "No Bikes" if (@bike.length == 0)
    @bike.pop

  end

  def dock(bike)
    raise "Is Full" if @bike.length >= 20
    @bike.push(bike)
  end
  # replaced by attr_accessor
  # def bike
  #   @bike
  # end
end
