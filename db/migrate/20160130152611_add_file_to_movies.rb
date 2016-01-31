class AddFileToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_file, :string
  end
end
