

class Van

  def initialize
  	@contents = []
  end

  def collect(source)
    contents << source.bikes_for_moving
  end


  private
  attr_reader :contents

end

