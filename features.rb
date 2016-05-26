require './lib/docking_station.rb'
require './lib/bike.rb'
station = DockingStation.new(35)
cycle = Bike.new

cycle.report

station.dock(cycle)

p "======================"
p "suspect line"
p "print station"
p station
p "print station.bike"
p station.bike
p "print station.bike.last"
p station.bike.last
p "print station.bike.last.working?"
p station.bike.last.working?
station.bike.last.working?
p "line printed"
bicycle = Bike.new
bicycle.report
station.dock(bicycle)

