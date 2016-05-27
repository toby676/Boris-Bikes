require 'van'
require 'docking_station'

describe Van do

  # let(:station) { double(:station) }
  let(:van) {Van.new}


  context "responds" do
    it {is_expected.to respond_to(:collect).with(1).argument}
  end

  context "#collect" do
    before(:each) do
      @station = DockingStation.new
    end
    it "requests broken bikes from station" do
       expect{van.collect(@station)}.not_to raise_error
    end
    it 'returns an array from station' do
       expect(van.collect(@station)).to be_a(Array)
     end

  end
end
