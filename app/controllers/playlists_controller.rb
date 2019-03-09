class PlaylistsController < ApplicationController

  before_action :set_playlist, only: [:show, :edit, :destroy, :update]
  def index
    @playlists = current_user.playlists
  end

  def show
  end

  def new
    @playlist = current_user.playlists.new
  end

  def create
    @playlist = current_user.playlist.new(playlist_params)
    if @playlist.save
      redirect_to [@user, @playlist] #psudo route
    else
      render :user
    end
  end

  def edit
    #
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to [@user, @playlist]
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
    redirect_to users_playlists_path # may need to update route
end

private

def set_playlist
  @playlist = Playlist.find(params[:id])
end

def playlist_params
  params.require(:playlist).permit(:name, :body)
end

end