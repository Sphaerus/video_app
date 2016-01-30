class MoviesController < ApplicationController
  
  def index
    @movies = current_user.movies
  end

  def new
    @user = current_user
    @movie = @user.movies.build
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @user = current_user
    @movie = @user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: "Movie successfully created!"}
      else
        format.html { render action: "new", alert: "Something went wrong:("}
      end
    end
  end

  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(movie_params)
        format.html { redirect_to movies_path, notice: "Movie successfully updated!"}
      else
        format.html { render action: "edit", alert: "Something went wrong:("}
      end
    end
    
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, notice: "Movie successfully deleted"
  end

  private

  def movie_params
    params.require(:movie).permit(:id, :user_id, :title, :description)
  end
end
