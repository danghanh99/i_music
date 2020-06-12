class Category < ApplicationRecord
  belongs_to :user
  has_many :songs, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  def self.get_list_category
    Category.pluck(:name)
  end
end
