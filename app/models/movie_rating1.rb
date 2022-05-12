class MovieRating1 < ApplicationRecord
  belongs_to :movie
  belongs_to :rating
  validates :movie_id, :rating_id, presence: true
end
