require 'docking_station'
require 'bike'

describe DockingStation do
  # it 'responds to release bike' do
  #   expect(DockingStation.new).to respond_to :release_bike
  # end
  it {is_expected.to respond_to :release_bike}
  it 'releases a bike' do
    #expect(DockingStation.new).to
    docking_station = DockingStation.new
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  it {is_expected.to respond_to(:dock).with(1).argument }
  it {is_expected.to respond_to :bike }
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
