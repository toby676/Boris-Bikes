require 'van'

describe Van do

  let(:station) { double(:station) }
  let(:van) {Van.new}


  context "responds" do
    it {is_expected.to respond_to(:collect).with(1).argument}
  end

  context "#collect" do
    it "requests broken bikes from station" do
       expect{van.collect(station)}.not_to raise_error
    end
  end
end
