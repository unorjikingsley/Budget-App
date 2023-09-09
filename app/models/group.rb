class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  # has_and_belongs_to_many :entities
  # has_one_attached :icon

  has_many :entities_group_to_joins, dependent: :destroy
  has_many :entities, through: :entities_group_to_joins

  validates :name, presence: true
  validates :icon, presence: true
end

# Category
