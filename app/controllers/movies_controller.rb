class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :show, :destroy, :last_image]
  
  def index
    @movies = current_user.movies
  end

  def new
    @user = current_user
    @movie = @user.movies.build
  end

  def show
  end

  def edit
    @movie.images = []
    @movie.images.build
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

  def last_image
    @image = @movie.images.last

    respond_to do |format|
      if @image
        format.json { render layout: false}
      else
        format.json { render json: false}
      end
    end
  end

  private

  def set_movie
    @movie = current_user.movies.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:id, :user_id, :title, :description, :movie_file)
  end
end
