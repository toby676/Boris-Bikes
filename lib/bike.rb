class Bike
  def initialize
    @work = true
  end

  def working?
    @work
  end
  
  def report
    @work = false
  end
end
