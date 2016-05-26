require './lib/docking_station.rb'
require './lib/bike.rb'
station = DockingStation.new(35)
cycle = Bike.new

station.dock(cycle.report)

station.bike.last.working?

bicycle = Bike.new
bicycle.report
station.dock(bicycle)

