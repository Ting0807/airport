require_relative 'weather'


class Airport
    @@array=Array.new

	 def initialize(name,weather, planes=[], bomb_scare=false, max=4)
	 @name=name
	 @weather=weather
	 @planes=planes
	 @bomb_scare=bomb_scare
	 @max=max
	 end

	 
	 def self.all_instances
	 	@@array
	 end

	 def count_of_planes
	 	@planes.count
	 end 

	 def fly_a_plane
	 	
	 	@planes.pop
		return @planes
	 end

	 def fly_in_the_sunny_day
	 	if @weather =='sunny'
	 	 fly_a_plane
	 	else
	 		@planes
	 	end
	 end

	 def land_a_plane
	 		@planes.push('plane')
	 end

    def land_in_the_sunny_day
	 	if @weather =='sunny'
	 	land_a_plane
		 else
	 	@planes
		end
	 end

	 def forbid_to_land_when_full
	 	if @planes.count < @max
	 	land_a_plane
		 else
		 @planes
		end

	 end

	 def forbid_to_fly_with_bomb
	 	if bomb_scare=true
	 	return @planes
		 else
		 fly_a_plane
		end
	 end


	 def forbid_to_land_with_bomb
	 	if bomb_scare=true
	 		return @planes
	 	else
	 		land_a_plane
	 	end
	 end
    
    def remove_bomb!
    	@bomb_scare=false
    end

	 # def has_plane?
	 # 	!plane.empty?
	 # end

	 # def has_weather
	 # 	!weather.nil?
	 # end 

	 # def knows_weather
	 # 	@weather=Weather.new.sample
	 # 	@weather=weather.sample
	 # end


end