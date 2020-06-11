class Song < ApplicationRecord
  has_many :album_songs, dependent: :destroy
  has_many :albums, through: :album_songs
  belongs_to :user
  belongs_to :category

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }
end
