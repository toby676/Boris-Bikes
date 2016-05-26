require 'docking_station'
require 'bike'

describe DockingStation do

  before(:each) do
    @docking_station = DockingStation.new()
    @cycle = Bike.new
    @capacity = DockingStation::DEFAULT_CAPACITY
  end

  context 'responses' do
    it {is_expected.to respond_to :release_bike}
    it {is_expected.to respond_to(:dock).with(1).argument }
    it {is_expected.to respond_to :bike }
  end

  context '#initializing' do
    it 'allows number to be specified' do
      expect{station = DockingStation.new(35)}.not_to raise_error
    end

  end

  context '#release_bike' do
    it 'releases a bike' do
      @docking_station.dock(@cycle)
      bike = @docking_station.release_bike
      expect(bike).to be_working
    end

    it 'doesnt release when empty' do
      expect{@docking_station.release_bike}.to raise_error("No Bikes")
    end

    it 'doesnt release when broken' do
      @docking_station.dock(Bike.new)
      @cycle.report
      @docking_station.dock(@cycle)
      expect{@docking_station.release_bike}.to raise_error("Broken Bike, Please Try Again")
    end

    it 'reports all bikes are broken' do
      @cycle.report
      @docking_station.dock(@cycle)
      expect{@docking_station.release_bike}.to raise_error("All Bikes Are Broken")
    end
  end

  context '#dock' do
    it 'allows a bike to dock' do
      @docking_station.dock(@cycle)
      expect(@docking_station.bike.last).to eq(@cycle)
    end

    it 'tells if dock is full' do
      @capacity.times{@docking_station.dock(@cycle)}
      expect{@docking_station.dock(@cycle)}.to raise_error("Is Full")
    end

    it 'allows #{@capacity} bikes to dock' do
      expect{@capacity.times{@docking_station.dock(@cycle)}}.not_to raise_error
    end
  end
  
  context '@bike' do
    it 'allows to see a docked bike' do
      @docking_station.dock(@cycle)
      expect(@docking_station.bike.last).to eq(@cycle)
    end
  end

  context '@capacity' do
    before(:each) do
      @station = DockingStation.new(35)
      @capacity = @station.capacity
    end

    it 'sets capacity' do
      expect(@capacity).to eq 35
    end

    it 'allows #{@capacity} bikes to dock' do
      expect{@capacity.times{@station.dock(@cycle)}}.not_to raise_error
    end
  end
end
