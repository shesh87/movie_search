require_relative "../lib/test"
require "pry"


RSpec.describe "Movie Search" do

	# it "should show error message when less then 9 movie posters are found" do
	# 	search = MovieSearch.new
	# 	results = search.posters!
	# 	expect(results).to eq("Sorry, there are not enough movies to display.")	
	# end

	it "should filter out movies with no poster image" do
		
		expect().to eq(nil)	
	end
end



# it "return Hello Dear" do
# 		print=FizzBuzz.new
# 		x = print.fizz("a")
# 		expect(x).to eq("Hello Dear")
# 	end