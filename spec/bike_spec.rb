require 'bike'

describe Bike do
  context 'responses' do
    it {is_expected.to respond_to :working? }
    it {is_expected.to respond_to :report }
  end
  
  context '#report' do
    it "changes status of working? to false" do
      cycle = Bike.new
      cycle.report
      expect(cycle.working?).to eq(false)
    end
  end


end
