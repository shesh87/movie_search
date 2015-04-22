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
	return search.movies#[0..20]
end

def movie_properties(array)
	# posters = []
	good_movies = []
	array.each do |object|
		if object.poster != nil
			# posters << object.poster
			good_movies << object 
		end
	end
	# return posters
	return good_movies[0..8]
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
	search_results = search_movies(params[:search_word])
	binding.pry
	movies_9 = movie_properties(search_results)
	binding.pry
	# session[:movies] = movies_9
	puts movies_9.instance_of?
	session[:posters] = get_posters(movies_9)
	
	# binding.pry
	# session[:year] = get_year(movies_9)

	# binding.pry
	redirect to("/movies")
end

get "/movies" do
	# @posters = session[:posters]
	# @year = session[:year]
	# @movies = session[:movies]
	erb :movies
end









