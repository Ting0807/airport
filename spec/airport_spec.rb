require 'airport'

describe 'Airport' do 

let (:weather){double :weather, { tell_the_weather: ['sunny','stormy'].sample}}
	
    let(:airport){Airport.new('heathrow',weather,['plane','plane','plane'])}
	

	it 'cotains a collection of planes' do
      
	expect(airport.count_of_planes).not_to eq 0

	 end


	# it 'knows the weather'do
	# # expect(airport).to have_weather
	# end

	it'let a plane to fly'do
	   
	  expect(airport.fly_a_plane).to eq ['plane','plane']

	end

    it'let a plane to fly when the weather is sunny' do

    	airport=Airport.new('heathrow','sunny', ['plane','plane','plane'])
    	expect(airport.fly_in_the_sunny_day).to eq ['plane','plane']
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
    	expect(airport.forbid_to_fly_with_bomb).to eq ['plane','plane','plane']
    end

    it'do not allow any plane to land when  there is a bomb scare.'do
    airport=Airport.new('heathrow',weather, ['plane','plane','plane'], true)
    	expect(airport.forbid_to_land_with_bomb).to eq ['plane','plane','plane']
	end 
	
	it'could remove a bomb scare'do
	   airport.remove_bomb!
	  expect(@bomb_scare).not_to be_true
	end
    
    it 'have a number of airport' do
    	expert(self.count).not_to equal 0
    end 

end