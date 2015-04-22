require "sinatra"
require "pry"
require "sinatra/reloader" if development?
#allows updating to the server with out reloading it.
require "logger"
enable :logger
require "imdb"
enable :sessions


def search_movies(word)
	search = Imdb::Search.new(word)
	return search.movies[0..20]
end

def movie_properties(array)
	good_movies = []
	array.each do |object|
		if object.poster != nil
			good_movies << object
			break if good_movies.count == 9
		end
	end
	return good_movies
end

def get_posters(array)
	posters = array.map do |movie|
		movie.poster
	end
	return posters
end

def get_year(array)
	year = []
	array.each do |movie|
		year << movie.year
	end
	return year.sample
end

# def year?(array)
# 	year = array.map do |movie|
# 		movie.year
# 	end
# 	session[:year] = year.sample
# end


################################################################



get "/" do
	erb :index
end

post "/search" do
	session[:search_results] = search_movies(params[:search_word])
	# movies_9 = movie_properties(search_results)
	# session[:posters] = get_posters(movies_9)
	# posters = get_posters(movies_9)
	# binding.pry
	# session[:year] = get_year(movies_9)

	binding.pry
	redirect to("/movies")
end

get "/movies" do
	@greeting = "HELLO"
	results = session[:search_results]
	@year = get_year(results)
	@movies = movie_properties(results)
	erb :movies
end









