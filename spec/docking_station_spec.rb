require 'docking_station'
require 'bike'

describe DockingStation do
  # checks custom functions
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument }
  it {is_expected.to respond_to :bike }

  it 'releases a bike' do
    docking_station = DockingStation.new
    docking_station.dock(Bike.new)
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  it 'doesnt release when empty' do
    docking_station = DockingStation.new
    expect{docking_station.release_bike}.to raise_error("No Bikes")
  end

  it 'allows a bike to dock' do
    station = DockingStation.new
    bike = Bike.new
    expect(station.dock(bike)).to eq(bike)
  end

  it 'allows to see a docked bike' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    expect(station.bike).to eq(bike)
  end
end
