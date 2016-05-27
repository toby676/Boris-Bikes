require 'docking_station'

describe DockingStation do
	
  let(:bike) { double(:bike, :broken? => false, :working? => true) }
  let(:broke) { double(:broke, :broken? => true, :working? => false) }  

  before(:each) do
    @station = DockingStation.new
  end

  context 'responses' do

    it {is_expected.to respond_to :release_bike}

    it {is_expected.to respond_to(:dock).with(1).argument}

    it {is_expected.to respond_to (:bikes)}

  end
  
  context '#release_bike' do
    it 'releases a bike if bikes are available' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raises an error if no bikes available' do
      expect{subject.release_bike}.to raise_error("No bikes available!")
    end

    it 'doesn\'t release latest bike when latest bike is broken' do
      @station.dock(broke)
      expect{@station.release_bike}.to raise_error("Sorry, there are no working bikes available!")
    end

    it 'releases a bike when there are working bikes and the last one is broken' do
      @station.dock(broke)
      @station.dock(bike)
      expect{@station.release_bike}.not_to raise_error
    end

    it 'raises error already removed all working bikes' do
      @station.dock(bike)
      @station.dock(broke)
      @station.release_bike
      expect{@station.release_bike}.to raise_error("Sorry, there are no working bikes available!")
    end

  end

  context '#dock(bike)' do
    it 'docks the bike when there is space available' do 
      expect(subject.dock(bike).last).to eq bike
    end
    it 'docks 20 bikes when capacity is set to default' do
      expect{DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}}.not_to raise_error
    end
    it 'raises an error when there is no space available when capacity is set to default' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error("No space available!")
    end
    it 'docks 50 bikes when capacity is set to 50' do
      station = DockingStation.new(50)
      expect{50.times {station.dock(bike)}}.not_to raise_error
    end
    it 'raises an error at 51 bikes when capacity is set to 50' do
      station = DockingStation.new(50)
      50.times {station.dock(bike)}
      expect{station.dock(bike)}.to raise_error("No space available!")
    end

  end

  context '#bikes_for_moving' do
    it 'returns an array of the broken bikes' do
      5.times {@station.dock(bike)}
      5.times {@station.dock(broke)}
      expect(@station.bikes_for_moving.length).to eq 5
    end
    it 'sorts the bikes into an array of broken bikes' do
      5.times do
        @station.dock(bike)
        @station.dock(broke)
      end
      expect(@station.bikes_for_moving.length).to eq 5
    end

  end

  context '#initialize' do
    it 'initialises with one argument' do
      expect{DockingStation.new(30)}.not_to raise_error
    end
    it 'initialises with default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  context ':bikes' do
    it 'returns docked bike' do 
    	subject.dock(bike)
    	expect(subject.bikes.last).to eq bike
    end

  end



end


