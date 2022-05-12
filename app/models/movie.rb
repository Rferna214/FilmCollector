class Movie < ApplicationRecord
	# has_many method specifies a one to many relationship
	# appearances option specifies that one movies has many appearances
	has_many :appearances, dependent: :destroy
	has_many :movie_rating1s, dependent: :destroy
	# actors option specifies that one movie has many actors
	# the through option specifies that the relationshop exists
	# only through appearances
	has_many :actors, through: :appearances
	has_many :ratings, through: :movie_rating1s
	# validates method specifies that an movie is valid only if
	# a title, duration, rating, and Release Date are present
	validates :title, :duration, :rating, :release_date, presence: true
end
