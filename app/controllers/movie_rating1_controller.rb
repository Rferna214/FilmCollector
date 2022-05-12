class MovieRating1Controller < ApplicationController

	def index
		@movies = Movie.all
		@ratings = Rating.all
		return @movies, @ratings
	end

	def rating
		@movies = Movie.all
		@ratings = Rating.all
		return @movies, @ratings
	end

	def new
	end
	def create
		movie_rating = MovieRating1.new(movie_rating1_params)
		if movie_rating.save
			redirect_to "/movies"
		else
			flash[:errors] = movie_rating.errors.full_messages
			redirect_to "/ratings/index"
		end
	end
	private
	def movie_rating1_params
		params.require(:movie_rating1).permit(:movie_id, :rating_id)
	end
end
