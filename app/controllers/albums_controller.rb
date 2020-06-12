class AlbumsController < ApplicationController
  before_action :list_songs, only: %i(new )
  def new
    @album = Album.new()
  end

  def create 
    @album = Album.new(album_params) if admin?
    if @album.save
      params[:album][:song_ids].each do |song_id|
        @album.album_songs.create(song_id: song_id) if song_id.present?
      end
      flash[:success] = "album created!"
      redirect_to album_path(@album)
    else
      flash[:danger] = "create album failed!"
      render "albums/new"
    end
  end

  private

  def list_songs
    @songs = Song.all.select(:id, :name).map{|song| [song.name, song.id]}
   end

  def album_params
    params.require(:album).permit(:name, album_songs_attributes: [ :id, :album_id, :song_id])
  end

end
