require 'docking_station'
require 'bike'

describe DockingStation do
  
  before(:each) do
    @docking_station = DockingStation.new
    @cycle = Bike.new
  end

  # checks custom functions
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument }
  it {is_expected.to respond_to :bike }

  it 'releases a bike' do
    @docking_station.dock(@cycle)
    bike = @docking_station.release_bike
    expect(bike).to be_working
  end

  it 'doesnt release when empty' do
    expect{@docking_station.release_bike}.to raise_error("No Bikes")
  end

  it 'allows a bike to dock' do
    expect(@docking_station.dock(@cycle)).to eq(@cycle)
  end
  
  it 'tells if dock is full' do
    @docking_station.dock(@cycle)
    expect{@docking_station.dock(@cycle)}.to raise_error("Is Full")
  end

  it 'allows to see a docked bike' do
    @docking_station.dock(@cycle)
    expect(@docking_station.bike).to eq(@cycle)
  end
end
