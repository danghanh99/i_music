class AlbumSong < ApplicationRecord
  belongs_to :album
  belongs_to :song
  validates :album_id, presence: true
  validates :song_id, presence: true
end
