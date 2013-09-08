

class Plane


	def initialize(pilot=['pilot'], copilot=['copilot'], stewards=['stewards', 'stewards','stewards'])
		@pilot = pilot
		@copilot = copilot
		@stewards=stewards


	end

	def crew_numbers  
		@pilot.count+@copilot.count+@stewards.count


		
	end

end 