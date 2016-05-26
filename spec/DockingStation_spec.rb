require 'DockingStation'

describe DockingStation do
	
  it {is_expected.to respond_to :release_bike}

  it {is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to (:bikes)}

  describe '#release_bike' do
    it 'releases a bike if bikes are available' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error if no bikes available' do
      expect{subject.release_bike}.to raise_error("No bikes available!")
    end
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
	  expect(bike).to be_working
	end
    
  describe '#dock(bike)' do
    it 'docks the bike when there is space available' do 
      bike = Bike.new
      expect(subject.dock(bike).last).to eq bike
    end
    it 'docks 20 bikes' do
      expect{20.times {subject.dock(Bike.new)}}.not_to raise_error
    end
    it 'raises an error when there is no space available' do
      20.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error("No space available!")
    end
  end

  it 'returns docked bike' do 
  	bike = Bike.new
  	subject.dock(bike)
  	expect(subject.bikes.last).to eq bike
  end

end


