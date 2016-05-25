require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    raise "Nothing to release" if empty?
    @bikes.pop
  end

  def dock bike
    raise "Docking station is full" if full?
    @bikes << bike
  end

  private

    def full?
      @bikes.size >= @capacity
    end

    def empty?
      @bikes.empty?
    end

end
