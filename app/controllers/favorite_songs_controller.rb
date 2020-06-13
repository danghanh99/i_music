class FavoriteSongsController < ApplicationController
  before_action :list_songs, only: %i(new )
  def new
    @favorite_song = FavoriteSong.new()
  end

  def create 
    @favorite_song = current_user.favorite_songs.build(favorite_song_params) #if log_in?
    if @favorite_song.save
      params[:favorite_song][:song_ids].each do |song_id|
        @favorite_song.song_favorite_songs.create(song_id: song_id) if song_id.present?
      end
      flash[:success] = "Favorite song created!"
      redirect_to favorite_song_path(@favorite_song)
    else
      flash[:danger] = "create favorite song failed!"
      render "favorite_songs/new"
    end
  end

  private

  def list_songs
    @songs = Song.all.select(:id, :name).map{|song| [song.name, song.id]}
  end

  def 
  def favorite_song_params
    params.require(:favorite_song).permit(:name, song_favorite_songs_attributes: [ :id, :album_id, :song_id])
  end
end
