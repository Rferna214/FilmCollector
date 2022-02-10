class Movie < ApplicationRecord
	# validates method specifies that an movie is valid only if
	# a title, duration, rating, and Release Date are present
	validates :title, :duration, :rating, :release_date, presence: true
end
