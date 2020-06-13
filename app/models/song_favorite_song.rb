class SongFavoriteSong < ApplicationRecord
  belongs_to :song
  belongs_to :favorite_song
  
  validates :favorite_song_id, presence: true
  validates :song_id, presence: true
end
