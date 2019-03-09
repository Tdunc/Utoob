class MoviesController < ApplicationController

 before_action :set_movie, only: [:show, :edit, :update]

  def index
    @movies = current_user.movies
  end

  def show
  end

  def create
  @movie = current_user.movies.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def new
    @movie = current_user_movies.new
  end

  def edit
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private 

  def movie_params
    params.require(:movie).permit(:title, :duration, :genre, :description, :trailer)
  end

  def set_movie
    @movie = current_user.movies.find(params[:id])
  end
end
