require_relative 'Bike'

class DockingStation

  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  	def initialize
  	  @bikes = []
  	end

	def release_bike
	  raise "No bikes available!" if empty?
	  @bikes.pop
	end

	def dock(bike)
	  raise "No space available!" if full?
	  @bikes << bike
	end

	private

	def full?
	  true if @bikes.length >= DEFAULT_CAPACITY
	end

	def empty?
	  true if @bikes.empty?
	end

end