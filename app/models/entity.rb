class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :email, presence: true, numericality: { greater_than: 0 }
end
