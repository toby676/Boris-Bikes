
class DockingStation
  attr_accessor :bike
  def release_bike
    if @bike
      Bike.new
    else  
      raise "No Bikes"
    end
  end

  def dock(bike)
    @bike = bike
  end
  # replaced by attr_accessor
  # def bike
  #   @bike
  # end
end
