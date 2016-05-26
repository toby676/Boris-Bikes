require 'docking_station'

class Van

  attr_reader :broken

  def initialize
    @broken = []
  end

  def collect(source)
    raise "No bikes to collect" if source.bike.length == 0 
    raise "No broken bikes" if source.all_fixed?
    source.bike.each do |b|
      if b.working? == false
        @broken << b
        source.bike.delete(b)
      end
    end
  end

  def deliver(destination)
    
  end

end
