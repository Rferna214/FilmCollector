class MoviesController < ApplicationController
	# index methods gets called when the movies URL is requested.
	# index methods gets mapped to the movies index.html.erb
	def index
		# call all method on Movie model class.
		# all method selects all of the data in the movie table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varibale is available to movies index.html.erb.
		@movies = Movie.all
	end


	#new method gets called when the movies/new URL is requested.
	#new method is mapped to the movies new.html.erb
	def new
	end

	# create method gets called when the Create button is pushed on
	# the movies new.html.erb
	def create 
		# call constructor of Movie model class giving it the 
		# title, duration, rating, release date parameters input in the movies
		# new.html.erb
		# construct creates Movie model object which is stored
		# in variable
		movie = Movie.new(movie_params)
		# call save method on Movie object
		# save method inserts the data in the Movie model object
		# into the movie table
		if movie.save
			# if the save method succeeds, request the movies URL
			# which will rendor the movies index.html.erb in the browser
			redirect_to "/movies"
		else 
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the movies new.html.erb
			flash[:errors] = movie.errors.full_messages
			# if the save method fails, request the movies/new URL
			# which will rendor the movies new.html.erb in the browser
			redirect_to "/movies/new"
		end
	end

	# show method gets called when the actors/:id URL is requested 
	# show method is mapped to the movies show.html.erb
	def show
		# call find method on Movies model class giving it the id sent
		# in the request
		# find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request 
		# selected data will be returned in array of actor objects
		# store the array of movie objects in an instance variable
		# instance variable is available to movies show.html.erb
		@actors = Movie.find(params[:id]).actors
		
	end

	def rating
		@actors = Movie.find(params[:id]).actors
	end

	def edit
		@movies = Movie.find(params[:id])
	end

	def update
		
		movie = Movie.find(params[:id])
		
		if movie.update(movie_params)
			
			redirect_to "/movies"
		else
			
			flash[:errors] = movie.errors.full_messages
			
			redirect_to "/movies/#{movie.id}/edit" 
	end
end

def delete
		
		@movie = Movie.find(params[:id])
	end

	def destroy
		movie = Movie.find(params[:id])
		movie.destroy
		redirect_to "/movies"
	end


	private
	def movie_params
		# params is a Rails object that gets the specified request
		# parameters
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end
end
