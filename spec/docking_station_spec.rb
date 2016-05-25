require 'docking_station'

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
    
  end
end
