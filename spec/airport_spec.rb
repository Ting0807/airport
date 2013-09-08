require 'airport'

describe 'Airport' do 

let (:weather){double :weather}
	
    let(:airport){Airport.new('heathrow',weather,['plane','plane','plane'],runway=[])}
	

	it 'cotains a collection of planes' do
      
	expect(airport.count_of_planes).not_to eq 0

	 end


	it 'knows the weather'do
	expect(airport.tell_today_weather).to eq 'sunny' or 'stormy'
	end

	it'let a plane to fly'do
	   
	  expect(airport.fly_a_plane).to eq ['plane']

	end

    it'let a plane to fly when the weather is sunny' do

    	airport=Airport.new('heathrow','sunny', ['plane','plane','plane'])
    	expect(airport.fly_in_the_sunny_day).to eq ['plane']
    end

	it'let a plane to land 'do
	  expect(airport.land_a_plane).to eq ['plane','plane','plane','plane']
    end


	it'let a plane to land when the wether is sunny'do
	airport=Airport.new('heathrow','sunny', ['plane','plane','plane'])
	  expect(airport.land_in_the_sunny_day).to eq ['plane','plane','plane','plane']
    end



	it 'forbid a plane to land when the airport is full' do
		airport=Airport.new('heathrow',weather, ['plane','plane','plane','plane'])
		expect(airport.forbid_to_land_when_full).to eq ['plane','plane','plane','plane']
	end    


    it'do not allow any plane to take off when there is a bomb scare.' do
    	airport=Airport.new('heathrow', weather, ['plane','plane','plane'], true)
    	expect(airport.forbid_to_fly_with_bomb).to eq nil
    end

    it'do not allow any plane to land when  there is a bomb scare.'do
    airport=Airport.new('heathrow',weather, ['plane','plane','plane'], true)
    	expect(airport.forbid_to_land_with_bomb).to eq ['plane','plane','plane']
	end 
	
	it'could remove a bomb scare'do
	   airport.remove_bomb!
	  expect(@bomb_scare).not_to be_true
	end
    
    # it 'have a number of airport' do
    # 	@@array=Array.new
    # 	airport1=Airport.new('heathrow',weather, ['plane','plane','plane'], true)
    # 	airport2=Airport.new('manchester',weather, ['plane','plane','plane'], true)
    # 	airport.self.all_instances
    # 	expect(@@array.count).to equal 2
    # end 
    
    it 'let plane be ready at the runway before shooting off' do
        
        expect(airport.move_to_runway?).to be_true

    end 
     
     it 'requires traffic controller to give final permission to a flight at runway' do
     
     	expect(airport.final_take_off?).to be_true
     end 

end