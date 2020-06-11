class SongsController < ApplicationController
  def new
    @song = Song.new()
  end

  def create 
    @song = current_user.songs.build(song_params) if admin?
    category = Category.find_by name: params[:song][:category]  
    @song.category_id = category.id
    if @song.save
      flash[:success] = "song created!"
      redirect_to song_path(@song)
    else
      render "songs/new"
    end
  end

  def show
    @song = Song.find(params[:id]) 
    raise ActiveRecord::RecordNotFound unless @song
    @song
  end
  private

  def song_params
    params.require(:song).permit(:name, :artist, :lyric, :mp3)
  end

end
