require 'weather'

describe 'Weather'  do 
	weather=Weather.new

	it 'knows weather could be sunny or stormy ' do

     expect(weather.tell_the_weather).to eq ('sunny' || 'stormy')
 end 

	
	

end