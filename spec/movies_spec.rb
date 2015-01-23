require_relative "../lib/test"
require "pry"


RSpec.describe "Movie Search" do

	# it "should show error message when less then 9 movie posters are found" do
	# 	search = MovieSearch.new
	# 	results = search.posters!
	# 	expect(results).to eq("Sorry, there are not enough movies to display.")	
	# end

	it "test movies with no poster are being filtered out" do
		my_movie = MovieSearch.new
		results = my_movie.search_movies "funny"
		posters_yes = my_movie.posters?(results)
		got_posters = my_movie.posters!(posters_yes)
		expect(got_posters[0..8]).to eq(
			["http://ia.media-imdb.com/images/M/MV5BMTYwMDY3NTE2OV5BMl5BanBnXkFtZTgwMjI1NjM4MzE@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMTMyODEyMzc0Nl5BMl5BanBnXkFtZTcwNjQ4MzA1MQ@@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMTQyOTA5NTkyMF5BMl5BanBnXkFtZTgwNzE3NDI0MjE@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMTg4OTExNTYzMV5BMl5BanBnXkFtZTcwOTg1MDU1MQ@@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMjI1NDg3MDU5Nl5BMl5BanBnXkFtZTcwMDg0ODg5OQ@@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMTMxNDQ5MTA5MF5BMl5BanBnXkFtZTcwMzUyMDUwMg@@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMTcwMTMyMDA3N15BMl5BanBnXkFtZTcwODUzMjk3OA@@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BMjAwNDIxMjk2M15BMl5BanBnXkFtZTcwOTUyNzgxMQ@@.jpg", 
				"http://ia.media-imdb.com/images/M/MV5BODkxMDg0MjM2OF5BMl5BanBnXkFtZTcwMjc0NTU4MQ@@.jpg"])	
	end
end



# it "return Hello Dear" do
# 		print=FizzBuzz.new
# 		x = print.fizz("a")
# 		expect(x).to eq("Hello Dear")
# 	end