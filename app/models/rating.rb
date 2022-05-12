class Rating < ApplicationRecord
	has_many :movie_rating1s, dependent: :destroy
	has_many :movies, through: :movie_rating1s
	validates :rating, presence: true
end
