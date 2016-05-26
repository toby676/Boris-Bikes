require 'van'
require 'docking_station'
require 'bike'
require 'garage'

describe Van do

  #let(:cycle) { double(:cycle, :working? => false, :report => false) }
  #let(:bicycle) { double(:bicycle, :working? => true, :report => true) }
  #let(:station) { double(:station, :dock ) }
  #let(:garage) { double(:garage) }

  before(:each) do
    @station = DockingStation.new
    @cycle = Bike.new
    @van = Van.new
    @garage = Garage.new
  end

  context 'responses' do
    it {is_expected.to respond_to(:collect).with(1).argument}
    it {is_expected.to respond_to(:deliver).with(1).argument}
    it {is_expected.to respond_to(:broken)}
  end

  context '#collect' do
    it 'collects broken bikes' do
      @cycle.report
      @station.dock(@cycle)
      @van.collect(@station)
      expect(@van.broken.last).to eq(@cycle)
    end

    it 'returns an error if no bikes' do
      expect{@van.collect(@station)}.to raise_error("No bikes to collect")
    end

    it 'returns an error if no broken bikes' do
      @station.dock(@cycle)
      expect{@van.collect(@station)}.to raise_error("No broken bikes")
    end
  end

  context '#deliver' do
    if 'delivers broken bikes' do
      @cycle.report
      4.times{@station.dock(@cycle)}
    end
  end
end
