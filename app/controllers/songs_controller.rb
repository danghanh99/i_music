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

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:success] = "Song deleted"
    redirect_to current_user
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    category = Category.find_by name: params[:song][:category]  
    @song.category_id = category.id
    if @song.update_attributes(song_params)
      flash[:success] = "Song updated"
      redirect_to song_path(@song)
    else
      render "edit"
    end
  end
  private

  def song_params
    params.require(:song).permit(:name, :artist, :lyric, :mp3)
  end

end
