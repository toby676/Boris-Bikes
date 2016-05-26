class DockingStation
  attr_accessor :bike
  DEFAULT_CAPACITY=20
  def initialize
    @bike = []
  end

  def release_bike
    raise "No Bikes" if empty?
    @bike.pop

  end

  def dock(bike)
    raise "Is Full" if full?
    @bike.push(bike)
  end

  private

  def full?
    return true if @bike.length >= DEFAULT_CAPACITY
    false
  end

  def empty?
    return true if @bike.length == 0
    false
  end
end
