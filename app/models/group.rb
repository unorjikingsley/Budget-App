class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :entities
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
end

# Category
