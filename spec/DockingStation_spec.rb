require 'DockingStation'

describe DockingStation do
	
  it {is_expected.to respond_to :release_bike}

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
    
  it {is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to (:bike)}

  it 'docks the bike' do 
  		bike = Bike.new
  		expect(subject.dock(bike)).to eq bike
  end 

  it 'returns docked bike' do 
  	bike = Bike.new
  	subject.dock(bike)
  	expect(subject.bike).to eq bike
  end

end


