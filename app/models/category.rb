class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  def self.get_list_category
    Category.pluck(:name)
  end
end
