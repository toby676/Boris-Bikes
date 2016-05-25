require_relative 'Bike'

class DockingStation
	def release_bike
		Bike.new
	end
   
   def docked? 
   	true
   end

end