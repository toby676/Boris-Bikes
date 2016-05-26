class DockingStation
  attr_accessor :bike, :capacity
  DEFAULT_CAPACITY=20
  def initialize(cap=DEFAULT_CAPACITY)
    @bike = []
    @capacity = cap
  end

  def release_bike
    raise "No Bikes" if empty?
    raise "All Bikes Are Broken" if all_broke?
    shift if !(@bike.last.working?) 
    @bike.pop
  end

  def dock(bike)
    raise "Is Full" if full?
    @bike.push(bike)
  end

  private

  def full?
    return true if @bike.length >= @capacity
    false
  end

  def empty?
    return true if @bike.length == 0
    false
  end

  def all_broke?
    current_bike = @bike.map{|b| b.working?}
    return false if current_bike.include?(true)
    true
  end

  def shift
    a = @bike.pop
    @bike.unshift(a)
    raise "Broken Bike, Please Try Again"
  end
end
