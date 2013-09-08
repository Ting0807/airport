require_relative 'weather'
require_relative 'plane'

class Airport
	# attr_reader :bike_list
 # attr_reader :station_max
 attr_accessor :runway
    
   

	 def initialize(name,weather, planes=[], bomb_scare=false, max=4, runway=[])
	 @name=name
	 @weather=weather
	 @planes=planes
	 @bomb_scare=bomb_scare
	 @max=max
	 @runway=runway
	 end



	 def tell_today_weather

	 	today_weather=Weather.new
	 	@weather=today_weather.tell_the_weather

	 end

	 
	 # def self.all_instances
	 # 	@@array
	 # end

	 def count_of_planes
	 	@planes.count
	 end 

	 def fly_a_plane
	 	
	 	return @runway << ( @planes.pop )
		
	 end

	 def fly_in_the_sunny_day
	 	if @weather =='sunny'
	 	 fly_a_plane
	 	
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
	 	return nil
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

    def move_to_runway?
    	n=@runway.count
    	fly_a_plane
    	(@runway.count-1)==n
    	
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

	 def final_take_off(permission)
	 	@permission=permission
	 	if @permission==true
	 		@runway.pop

	 	end

	 end 

     def final_take_off?
     	n=@runway.count
     	final_take_off(true)
     	(@runway.count + 1)==n
     end
end