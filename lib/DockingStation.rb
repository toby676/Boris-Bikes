require_relative 'Bike'

class DockingStation

  attr_reader :bikes

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
	  true if @bikes.length >= 20
	end

	def empty?
	  true if @bikes.empty?
	end

end