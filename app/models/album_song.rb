class AlbumSong < ApplicationRecord
  belongs_to :album
  belongs_to :song
  validates :album_id, presence: true
  validates :song_id, presence: true

  def add_object album, song, type
    type == 'album' ? album.album_songs.create(song: song) : song.album_songs.create(album: album)
  end

  def remove_object album, song, type
    type == 'album' ? album.album_songs.find_by(song_id: song.id).destroy : song.album_songs.find_by(album_id: album.id).destroy
  end

  def check_song_include_album? album, song
    album.songs.include? song
  end
end
