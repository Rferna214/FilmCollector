class CreateMovieRating1s < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_rating1s do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
