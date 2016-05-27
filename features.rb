require './lib/docking_station.rb'
require './lib/bike.rb'
require './lib/garage.rb'
require './lib/van.rb'

station = DockingStation.new(35)
cycle = Bike.new
garage = Garage.new
van = Van.new

van.collect(station)
van.deliver(garage)

van.collect(garage)
van.deliver(station)
