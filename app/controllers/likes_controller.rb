class LikesController < ApplicationController
        
     
  def create
    @movie.likes.create(user_id: current_user.id)
    redirect_to movie_path(@movie)
  end

  private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end