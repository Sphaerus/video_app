class ImagesController < ApplicationController
  before_action :set_movie

  def create
    new_image = @movie.images.build(image_params[:image])

    respond_to do |format|
      if new_image.save
        format.html { redirect_to @movie }
        format.json { render json: new_image.content}
      else
        format.html { redirect_to @movie }
        format.json { render json: false}
      end  
    end
  end

  def destroy
    @image = @movie.images.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html {redirect_to movie_path(@movie), notice: "Image successfully deleted"}
      format.json {render json: {id: @image.id}}
    end  
  end

  private

  def set_movie
    @movie = current_user.movies.find(params[:movie_id])
  end

  def image_params
    params.require(:movie).permit(image: [:content])
  end
end
